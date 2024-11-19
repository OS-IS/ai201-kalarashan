### Криптографічний захист клієнт-серверної взаємодії в СКБД PostgreSQL

### 1. Встановити OpenSSL-пакет. В терміналі командного рядку запустити утиліту openssl та переглянути перелік доступних команд.

![image](https://github.com/user-attachments/assets/c38160d5-d80c-4e9c-a91d-5716852aa21e)


### 2. Створити самопідписаний сертифікат для сервера СКБД PostgreSQL з наступними параметрами:

```
openssl req -new -x509 -days 130 -nodes -text -out server.crt -keyout server.key -subj "/C=UA/L=Odessa/O=OPU/OU=AI-201/CN=Kalarashan.op.edu.ua"

```
![image](https://github.com/user-attachments/assets/9aa947bc-bfa7-419d-ab11-4034aec4128d)


### 3. Переглянути вміст сертифікату та визначити алгоритми створення відкритого ключа, а також алгоритм встановлення цифрового підпису.

![image](https://github.com/user-attachments/assets/f0a6b970-920b-4c76-a76e-4b76b90ec3f7)

![image](https://github.com/user-attachments/assets/91f0ed65-267d-4b35-a9cf-590fcedc91dd)


### 4. Скопіювати створений сертифікат відкритого ключа та закритий ключ до каталогу сервера СКБД PostgreSQL, яка використовувалася у попередній лабораторній роботі. У конфігураційному файлі postgresql.conf налаштувати значення SSL-параметрів для підтримки SSL-з'єднання між сервером та клієнтами.

![image](https://github.com/user-attachments/assets/b0f5ae45-d41f-4837-9141-c14b35799145)



### 5. Використовуючи програму psql, встановити TSL/SSL-з'єднання з БД за прикладом з попередньої лабораторної роботи, але використовуючи формат параметрів "host=var1 port=var2 dbname=var3 user=var4 password=var5 sslmode=var6".

![image](https://github.com/user-attachments/assets/7d7fd21c-abe5-4d81-b780-2b38ba65a064)


### 6. Встановити ПЗ контейнерної віртуалізації Docker та запустити Docker через ваш Docker-обліковий запис.

![image](https://github.com/user-attachments/assets/ad54a295-2fd2-478d-a899-33e7bd197e2c)


### 7. Запустити Docker-контейнер СКБД PostgreSQL, використовуючи раніше розглянуті приклади (порт прослуховування запитів СКБД PostgreSQL = 5466).

![image](https://github.com/user-attachments/assets/bd1b7596-4105-4237-b22e-d1e60cefb7b0)


### 8. У Docker-контейнері встановити програмний пакунок аналізу мережевих пакетів tcpdump. Отримати перелік мережевих інтерфейсів на вашому комп’ютері.

![image](https://github.com/user-attachments/assets/6eed73aa-1c5f-4691-bb3d-d5c9a7456dfa)

![image](https://github.com/user-attachments/assets/79152549-759b-42b7-8947-96b62d9810c9)


### 9. Провести запуск програми аналізу мережевих пакетів для кожного мережевого інтерфейсу поки не буде знайдено активний інтерфейс, який взаємодіє з мережею Internet та виводить на екран інформацію про ці пакети.

![image](https://github.com/user-attachments/assets/45f96fb7-3ff8-4a10-989d-9bdedf9266ea)


### 10. Запустити програму аналізу мережевих пакетів в режимі прослуховування обраного мережевого інтерфейсу та налаштувати її на перегляд пакетів, які пов`язані з портом 5455, зберігаючи зміст пакетів в окремому файлі через перенаправлення потоку, наприклад, > res.dump. Результати роботи будуть використанні у наступних завданнях.

![image](https://github.com/user-attachments/assets/ae49a7ff-8dfe-4e73-859d-7e1db66c07f0)


```
tcpdump -i eth0 -nn -v -A tcp port 5455 > res.dump

```
![image](https://github.com/user-attachments/assets/4745753f-809c-4418-b9dc-ea87f06aa4c1)



### 11. Запустити окрему термінальну консоль та становити зв'язок із СКБД PostgreSQL, яка запущена через Docker-контейнер. Після успішного встановлення визначити версію TSL - протоколу та перелік використаних криптографічних алгоритмів.


### 12. Виконати команду створення користувача за прикладом з лабораторної роботи №6.



### 13. Проаналізувати вміст перехоплених пакетів, які було збережено у файлі, наприклад, res1.dump. Підтвердити передачу деяких даних у відкритому вигляді.



### 14. Повторити пункт 11, встановивши зв’язок із СКБД, але вже через TLS/SSL - з’єднання.

```
tcpdump -i eth0 -nn -v tcp port 5466 -X -w res-secure.dump

```
![Image 15](https://github.com/user-attachments/assets/574bacab-b1cc-4dfc-8145-0d0a5e3203e2)

### 15. Проаналізувати вміст перехоплених пакетів в програмі-аналізаторі. Підтвердити відсутність даних у відкритому вигляді.

![Image 16](https://github.com/user-attachments/assets/6d822740-bda3-48da-99da-e9c3cba3e73d)
