FROM python:3.9-slim

# Instala Uvicorn
RUN pip install 'uvicorn[standard]'

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo requirements.txt en el contenedor
COPY requirements.txt /app/

# Instala las dependencias desde requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Copia el resto de la aplicación en el contenedor
COPY . /app

# Expone el puerto en el que correrá la aplicación
EXPOSE 8000

# Comando para correr la aplicación
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
