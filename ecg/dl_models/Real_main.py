from flask import Flask, request, jsonify
from flask_cors import CORS
import time
from main import main
from save import save
from graph import graph

app = Flask(__name__)
CORS(app)

@app.route("/upload", methods=["GET", "POST"])
def upload_file():
    if request.method == "POST" :

        start = time.time()
        print(start)
        
        image_name = request.form.get("fileName")
        file_extension = request.form.get("fileExtension")
        user_id = request.form.get("user_id")
        orign_file = f"{image_name}.{file_extension}"
          
        print(image_name)
        print(file_extension)
        print(orign_file)
        print(user_id)
        
        out = main(orign_file, user_id)
        time.sleep(10)
        graph(orign_file, image_name)
        
        save(orign_file,user_id,out,start,image_name)
        
        
        
        return "성공"
    else :
        print(request.args.get("fileName"))
        return "get방식"
   
if __name__ == '__main__':
    app.run(host="127.0.0.1", port="9000")
