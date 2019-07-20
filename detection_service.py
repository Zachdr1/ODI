from flask import Flask, request, flash, Response, send_file
from werkzeug.utils import secure_filename
import shlex, subprocess
import os

UPLOAD_FOLDER = './uploaded_files'

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['SECRET_KEY'] = '\xa8c5\xd7GQ\xca\xa5\xd5?J' + \
                            '\xb1\xb7\x8e\x15\xd7J\xa7' + \
                            'x94w\xdc\xed\xd3\x1d'

@app.route('/detection_service/detect', methods=['GET', 'POST'])
def detect():
    if 'file' not in request.files:
        return Response(status=400)
    file = request.files['file']
    app.logger.info(file)
    if file:
        filepath = f'{UPLOAD_FOLDER}/{secure_filename(file.filename)}'
        file.save(filepath)
        os.chdir('./darknet')
        command = f'./darknet detect cfg/yolov3.cfg yolov3.weights ./../{filepath}'
        args = shlex.split(command)
        subprocess.Popen(args)
        os.chdir('./../')
    return Response(status=200)

@app.route('/detection_service/results')
def results():
    results_path = './darknet/predictions.jpg'
    if os.path.exists(results_path):
        return send_file('./darknet/predictions.jpg')
    else:
        return(Response(status=404))

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
