FROM docker.io/library/ubuntu:latest

# 更新软件源并安装Python、pip、venv
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /app

# 复制依赖文件
COPY requirements.txt .

# 创建虚拟环境
RUN python3 -m venv /opt/venv
# 用虚拟环境的pip安装依赖
RUN /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# 复制应用代码
COPY app.py /opt/app.py

# 运行时指定虚拟环境的Python
CMD ["/opt/venv/bin/python", "/opt/app.py"]
