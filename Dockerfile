FROM python:3.12-slim
RUN pip install --no-cache-dir "rendercv[full]"
WORKDIR /data
ENTRYPOINT ["rendercv"]
