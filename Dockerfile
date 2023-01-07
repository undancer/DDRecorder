FROM python:3.10
RUN apt-get update && apt-get install -y ffmpeg
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN curl -o ~/.fastNLP/download/fasthan_base.zip http://212.129.155.247/fasthan/fasthan_base.zip
RUN unzip ~/.fastNLP/download/fasthan_base.zip -d ~/.fastNLP/fasthan
COPY . .
CMD ["python", "-u", "main.py", "config/config.json"]
