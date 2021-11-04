alias bw_backend="docker start bw_backend; docker exec -i bw_backend ./manage.py runserver 8080 --insecure"
alias bw_clear="docker exec -it bw_backend python manage.py flush"
alias bw_stop="docker stop bw_backend"

