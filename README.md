# Итоговая контрольная работа по блоку специализация
Необходимо организовать систему учета для питомника, в котором живут домашние и вьючные животные.

## 1. Linux

1. Используя команду cat в терминале операционной системы Linux, 
создать два файла Домашние животные (заполнив файл собаками, кошками,
хомяками) и Вьючные животными заполнив файл Лошадьми, верблюдами и
ослы), а затем объединить их. Просмотреть содержимое созданного файла.
Переименовать файл, дав ему новое имя (Друзья человека).
![1.png](foto%2F1.png)

![2.png](foto%2F2.png)

![3.png](foto%2F3.png)

![4.png](foto%2F4.png)

![5.png](foto%2F5.png)

2. Создать директорию, переместить файл туда.

![6.png](foto%2F6.png)

3. Подключить дополнительный репозиторий MySQL. Установить любой пакет
   из этого репозитория.

![7.png](foto%2F7.png)

![8.png](foto%2F8.png)

4. Установить и удалить deb-пакет с помощью dpkg.

![9.png](foto%2F9.png)

![10.png](foto%2F10.png)

5. Выложить историю команд в терминале ubuntu
   
![11.png](foto%2F11.png)

## Диаграмма классов
6. Нарисовать диаграмму, в которой есть родительский класс, 
домашние животные и вьючные животные, в составы которых в случае домашних
животных войдут классы: собаки, кошки, хомяки, а в класс вьючные животные
войдут: Лошади, верблюды и ослы).

## 2. MySQL
7. В подключенном MySQL репозитории создать базу данных "Друзья
   человека"

![12.png](foto%2F12.png)
![13.png](foto%2F13.png)
![14.png](foto%2F14.png)

8. Создать таблицы с иерархией из диаграммы в БД
![15.png](foto%2F15.png)
![16.png](foto%2F16.png)


9. Заполнить низкоуровневые таблицы именами(животных), командами
   которые они выполняют и датами рождения
10. Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой
    питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.
11. Создать новую таблицу “молодые животные” в которую попадут все
животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице
12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на
    прошлую принадлежность к старым таблицам.

## 3. Java
13. Создать класс с Инкапсуляцией методов и наследованием по диаграмме.
14. Написать программу, имитирующую работу реестра домашних животных.
    В программе должен быть реализован следующий функционал:

14.1 Завести новое животное
14.2 определять животное в правильный класс
14.3 увидеть список команд, которое выполняет животное
14.4 обучить животное новым командам
14.5 Реализовать навигацию по меню
    
15. Создайте класс Счетчик, у которого есть метод add(), увеличивающий̆
    значение внутренней̆int переменной̆на 1 при нажатии “Завести новое
    животное”. Сделайте так, чтобы с объектом такого типа можно было работать в
    блоке try-with-resources. Нужно бросить исключение, если работа с объектом
    типа счетчик была не в ресурсном try и/или ресурс остался открыт. Значение
    считать в ресурсе try, если при заведении животного заполнены все поля.

*Подготовил студент Geek Brains* [**`Костюнин Алексей`**](https://gb.ru/users/c8f95aef-7056-4472-b7e4-841ece2c09f7)
