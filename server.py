from bottle import Bottle, run, route, static_file, request, response, template, redirect
from pymongo import MongoClient
from bson.json_util import dumps
from bson.objectid import ObjectId
from string import Template
import json
import pymongo
import requests
import datetime
import time
import math
import hashlib as hl
import os
import smtplib
import boto3
import uuid

app = Bottle(__name__)

client = MongoClient('mongodb://rah:rah@18.212.25.180/rah')
db = client.rah

# Static Routes
@app.route('/<filename:re:.*\.html>')
def javascripts(filename):
    return static_file(filename, root='templates')

@app.route('/<filename:re:.*\.js>')
def javascripts(filename):
    return static_file(filename, root='static')

@app.route('/<filename:re:.*\.css>')
def stylesheets(filename):
    return static_file(filename, root='static')

@app.route('/<filename:re:.*\.(jpg|png|gif|ico|svg)>')
def images(filename):
    return static_file(filename, root='static')

@app.route('/<filename:re:.*\.(eot|ttf|woff|svg)>')
def fonts(filename):
    return static_file(filename, root='static')

@app.route('/<filename:re:.*\.html>')
def javascripts(filename):
    return static_file(filename, root='static')

@app.route('/<filename:re:.*\.pdf>')
def pdfs(filename):
    return static_file(filename, root='static')

@app.route('/<filename:re:.*\.json>')
def javascripts(filename):
    return static_file(filename, root='static')

@app.hook('after_request')
def enable_cors():
	response.headers['Access-Control-Allow-Origin'] = '*'
	response.headers['Access-Control-Allow-Methods'] = 'PUT, GET, POST, DELETE, OPTIONS'
	response.headers['Access-Control-Allow-Headers'] = 'Origin, Accept, Content-Type, X-Requested-With, X-CSRF-Token'

@app.get('/')
def root():
	# return "Ok"
	return static_file('index.html', root='templates/')

@app.get('/solution')
def solution():

    sol_id = int(request.GET.get('sol_id'))

    products = []

    cur = db.solutions.find({'s_id': sol_id})
    data = json.loads(dumps(cur))

    if(sol_id == 1):
        products = ['cambium','mikrotik']
    elif(sol_id == 2):
        products = ['gemalto', 'radware']
    elif(sol_id == 3):
        products = ['forescout', 'gemalto', 'infoblox', 'ixia', 'radware', 'rapid7', 'seclore', 'skybox', 'innefu']
    elif(sol_id == 4):
        products = ['exinda', 'fatpipe', 'kemp', 'cambium','mikrotik']
    elif(sol_id == 5):
        products = ['actifio', 'quest']

    data[0]['products'] = products

    return template('templates/solution.tpl', data=data[0])

@app.get('/services')
def services():
    # return "Ok"
    return static_file('services.html', root='templates/')

@app.get('/product')
def product():
    # return "Ok"
    return static_file('product.html', root='templates/')

@app.get('/p')
def product_info():

    product_name = request.GET.get('n').lower()

    return static_file(product_name+'.html', root='templates/products/')    

@app.get('/media')
def media():
    # return "Ok"
    # cur = db.media_coverage.find()
    # data = json.loads(dumps(cur))

    # temp_data = data

    # temp_data.reverse()

    # return template('templates/media.tpl', basket=data)

    return static_file('media_new.html', root='templates')

@app.get('/ewaste')
def ewaste():
    return  static_file('ewaste.html', root='templates')

@app.get('/events')
def events():
    #cur = db.events.find()
    cur = db.events.find().sort('sno', pymongo.DESCENDING)
    data = json.loads(dumps(cur))

    data = list(reversed(data))

    return template('templates/events.tpl', basket=data)

@app.get('/add_media')
def add_media():
    return static_file('add_media.html', root='templates/')

@app.get('/support')
def support():
    return static_file('support.html', root='templates/')

@app.post('/add_media_post')
def add_media_post():

    pname = request.forms.get('name')
    caption = request.forms.get('caption')
    link = request.forms.get('link')
    date = request.forms.get('date')
    logo = request.files.get('logo')

    name, ext = os.path.splitext(logo.filename)

    if ext not in ('.png', '.jpg', '.jpeg'):
        return "File extension not allowed."

    save_path = '/media/suraj/Data/dev/rah/static/img/new_media'

    file_path = "{path}/{file}".format(path=save_path, file=logo.filename)
    logo.save(file_path)

    cur = db.media_coverage.insert({'name': pname, 'caption': caption, 'link': link, 'date': date, 'image': logo.filename})

    # return "Media coverage added"

    redirect('/media')

@app.get('/add_event')
def add_event():
    return static_file('add_event.html', root='templates/')

@app.post('/add_event_post')
def add_event_post():

    title = request.forms.get('title')
    image = request.files.get('image')
    info = request.forms.get('txtarea')

    name, ext = os.path.splitext(image.filename)

    if ext not in ('.png', '.jpg', '.jpeg'):
        return "File extension not allowed."

    # save_path = '/media/suraj/Data/dev/rah/static/img/new_events'
    save_path = '/home/ubuntu/rah_infotech_web/static/img/new_events'

    file_path = "{path}/{file}".format(path=save_path, file=image.filename)
    image.save(file_path)

    cur = db.events.insert({'title': title, 'info': info, 'image': image.filename, 'time_stamp': time.time()})

    # return "Media coverage added"

    redirect('/events')

@app.get('/event_detail')
def event_detail():

    e_id = request.GET.get('e_id')

    cur = db.events.find({'_id': ObjectId(e_id)})
    data = json.loads(dumps(cur))

    return template('templates/event_detail.tpl', data=data[0])


@app.get('/add_ticket')
def add_ticket():

    name = request.GET.get('name')
    email = request.GET.get('email')
    msg = request.GET.get('msg')

    cur = db.tickets.insert({'name': name, 'email': email, 'msg': msg, 'time_stamp': time.time()})

    return 'Ok'

@app.get('/<filename>')
def get_file(filename):
    return static_file(filename+'.html', root='templates/')

@app.get('/get_tickets')
def get_tickets():
    cur = db.tickets.find()
    data = json.loads(dumps(cur))

    return template('templates/get_tickets.tpl', basket=data)


@app.route('/sign_s3')
def sign_s3():
    S3_BUCKET = 'ocl-rah-test'

    file_name = request.GET.get('file_name') + '-' + uuid.uuid4().hex
    file_type = request.GET.get('file_type')
    folder_name = 'files'

    s3 = boto3.client('s3', region_name='us-east-1', aws_access_key_id=os.environ['AWS_KEY_ID'], aws_secret_access_key=os.environ['AWS_SECRET'])

    presigned_post = s3.generate_presigned_post(
        Bucket = S3_BUCKET,
        Key = folder_name+'/'+file_name,
        Fields = {"acl": "public-read", "Content-Type": file_type},
        Conditions = [
          {"acl": "public-read"},
          {"Content-Type": file_type}
        ],
        ExpiresIn = 3600
    )

    # print presigned_post

    return json.dumps({
    'data': presigned_post,
    'url': 'https://%s.s3.amazonaws.com/%s' % (S3_BUCKET, folder_name+'/'+file_name)
    })


@app.post('/add_user')
def add_user():
    name = request.forms.get('name')
    email = request.forms.get('email').lower()
    pwd = request.forms.get('pwd')

    cur = db.emp.find({'email': email})
    data = json.loads(dumps(cur))

    if(len(data) != 0):
        return {'response': 'User Exists'}
    else:
        cur = db.emp.insert({'name': name, 'email': email, 'pwd': pwd, 'time_stamp': time.time()})

        redirect('/manage_users')

@app.get('/manage_users')
def manage_users():
    cur = db.emp.find()
    data = json.loads(dumps(cur))

    return template('templates/manage_users.tpl', res=data)

@app.get('/edit_user')
def edit_user():
    cur = db.emp.find({'_id': ObjectId(request.GET.get('id'))})
    data = json.loads(dumps(cur))

    if(len(data) == 0):
        return {'response': 'User Not Existing'}
    else:
        return template('templates/edit_user.tpl', data[0])

@app.post('/edit_user')
def edit_user():
    name = request.forms.get('name')
    email = request.forms.get('email').lower()
    pwd = request.forms.get('pwd')
    oid = request.forms.get('id')

    cur = db.emp.find({'_id': ObjectId(oid)})
    data = json.loads(dumps(cur))

    if(len(data) == 0):
        return {'response': 'User Not Existing'}
    else:
        if(len(pwd) != 0):
            cur = db.emp.update({'_id': ObjectId(oid)}, {'$set': {'name': name, 'email': email, 'pwd': pwd, 'time_stamp': time.time()}})
        else:
            cur = db.emp.update({'_id': ObjectId(oid)}, {'$set': {'name': name, 'email': email, 'time_stamp': time.time()}})

        redirect('/manage_users')

@app.get('/delete_user')
def delete_user():
    cur = db.emp.remove({'_id': ObjectId(request.GET.get('id'))})

    redirect('/manage_users')


@app.get('/manage_files')
def manage_files():
    cur = db.files.find().sort('$natural', pymongo.DESCENDING)
    data = json.loads(dumps(cur))

    return template('templates/manage_files.tpl', res=data)

@app.get('/upload_file')
def upload_file():
    link = request.GET.get('link')
    name = request.GET.get('name')

    cur = db.files.insert({'name': name, 'link': link, 'time_stamp': time.time()})

    return {'status': 'OK'}

@app.get('/delete_file')
def delete_file():
    cur = db.files.remove({'_id': ObjectId(request.GET.get('id'))})

    redirect('/manage_files')

@app.get('/create_msg')
def create_msg():

    res = {'names': '', 'files': ''}

    cur = db.emp.find({},{'_id': 1, 'name': 1})
    data = json.loads(dumps(cur))

    res['names'] = data

    cur = db.files.find({},{'_id': 1, 'name': 1})
    data = json.loads(dumps(cur))

    res['files'] = data

    return template('templates/new_test.tpl', res)
# 8667001004,