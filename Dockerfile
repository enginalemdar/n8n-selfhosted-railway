# 1) Resmi n8n imajını baz al
FROM n8nio/n8n:latest

# 2) root’a geçiyoruz ki /home/node/.n8n altında klasör oluşturup yazabilelim
USER root

# 3) custom-nodes klasörünü önce oluştur, sonra da package.json’ı kopyala
RUN mkdir -p /home/node/.n8n/custom-nodes
COPY custom-nodes/package.json /home/node/.n8n/custom-nodes/

# 4) custom‑nodes dizinine gir ve npm install çalıştır
WORKDIR /home/node/.n8n/custom-nodes
RUN npm install

# 5) sahipliği node:node olarak ayarla (izinler tamamsın)
RUN chown -R node:node /home/node/.n8n

# 6) tekrar node kullanıcısına dön
USER node

# 7) n8n’e custom extension yolunu bildir
ENV N8N_CUSTOM_EXTENSIONS=/home/node/.n8n/custom-nodes/node_modules

# 8) Port zaten expose edilmiş ama belirtmek istersen
EXPOSE 5678
