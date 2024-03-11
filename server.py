from flask import Flask, request

app = Flask(__name__)

@app.route('/upload' , methods =['POST'] )
def sendImg():
    imagefile = request.files['image']
    imagefile.save('uploads/' + imagefile.filename)
    
    return "Image uploaded " , 200

if __name__ == '__main__':
    app.run(debug=True)