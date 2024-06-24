#!/bin/sh
echo "Inciando rotinas de pré-inicialização...."
echo "..."
rake assets:clean
rake log:clear
rake tmp:clear 
RAILS_ENV=production bin/delayed_job stop
# rpush stop * Retirado, as notificações agora são lidadas nos jobs *
rm -fR tmp/*
# rm -fR log/rpush.log

echo "Pré-compilando os assets..."
echo "..."
rake assets:precompile RAILS_ENV=production
echo "..."
echo "Recarregando o Apache / Proxy..."
echo "..."
sudo systemctl reload apache2
echo "Iniciando o Puma em modo de produção..."
echo "..."
puma -p 9291 -e production -d
echo "Inciando o sistema de notificação Rpush..."
echo "..."
RAILS_ENV=production bin/delayed_job start
# rpush start -e production
clear
echo " Serviço iniciado com sucesso!"
