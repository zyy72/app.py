# 基础镜像（以python为例）
FROM python:3.9-slim

# 设置工作目录
WORKDIR /opt

# 复制代码
COPY app.py .

# 安装flask
RUN pip install flask

# 启动命令
CMD ["python", "app.py"]
