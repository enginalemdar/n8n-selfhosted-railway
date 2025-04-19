# 1. Resmi n8n imajını baz al
FROM n8nio/n8n:latest

# 2. custom-nodes klasörünü kopyala ve bağımlılıkları yükle
COPY custom-nodes /home/node/.n8n/custom-nodes
RUN cd /home/node/.n8n/custom-nodes && npm install

# 3. Çalışma kullanıcısını node olarak ayarla
USER node

# 4. n8n'in custom extension yolunu göster
ENV N8N_CUSTOM_EXTENSIONS=/home/node/.n8n/custom-nodes/node_modules

# (Opsiyonel) Eğer workflow’lar ve credential’lar SQLite ile saklanacaksa:
# ENV DB_TYPE=sqlite
# ENV DB_SQLITE_VACUUM_ON_STARTUP=true

# 5. Portu expose et
EXPOSE 5678

# 6. Varsayılan CMD (n8n) zaten imajda tanımlı
