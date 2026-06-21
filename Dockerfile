FROM pytorch/pytorch:2.5.1-cpu

WORKDIR /app

COPY requirements-hf.txt .
RUN pip install --no-cache-dir -r requirements-hf.txt

COPY . .

EXPOSE 7860

CMD ["gunicorn", "--bind", "0.0.0.0:7860", "--workers", "1", "--timeout", "120", "wsgi:app"]
