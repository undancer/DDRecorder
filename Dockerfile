FROM python:3.10
RUN apt-get update && apt-get install -y ffmpeg
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN TEMP=$(mktemp) && \
      curl -o $TEMP http://212.129.155.247/fasthan/fasthan_base.zip && \
      mkdir -p ~/.fastNLP/fasthan && \ 
      unzip $TEMP -d ~/.fastNLP/fasthan && \
      rm -rf $TEMP
COPY . .
CMD ["python", "-u", "main.py", "config/config.json"]
