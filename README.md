# Практическая работа №4

## Тема: создать кликер

### Цель работы: создать проект с использованием Cubit. Реализовать счетчик при нажатии на кнопку + осуществляет увеличение счетчика, при нажатии на кнопку - осуществляться уменьшение счетчика. Если текущая тема устройства светлая то за одно нажатие должно +1 или -1. Если текущая тема устройства темная то за одно нажатие должно +2 или -2. Каждое действие должно записываться в историю. История должна быть реализована через виджет ListView.

### Ход работы:

#### Для начала работы добавим библиотеку flutter_bloc

#### Создадим класс HomeCubit. Он поможет нам в создании счетчика и истории:

![alt text](https://github.com/IoIdude/FlutterClicker/blob/main/pref/1.png)

#### Создадим класс ClickState. Он наследует класс HomeState и перехватывает состояние нажатой кнопки:

![alt text](https://github.com/IoIdude/FlutterClicker/blob/main/pref/2.png)

#### Класс ThemeCubit отвечает за смену темы в программе:

![alt text](https://github.com/IoIdude/FlutterClicker/blob/main/pref/3.png)

#### Создадим классы состояний DarkThemeState и LightThemeState наследующие класс ThemeState для темной и светлой тем соответственно:

![alt text](https://github.com/IoIdude/FlutterClicker/blob/main/pref/4.png)

#### Создаем класс Themes, хранящий информацию о цветах двух тем:

![alt text](https://github.com/IoIdude/FlutterClicker/blob/main/pref/5.png)

#### Затем в файле main создадим статичный заголовок приложения и BlocBuilder. BlocBuilder будет содержать в себе только те элементы, которые будут подвержены визуальным изменениям в ходе работы приложения. В нашем случае внутри BlocBuilder будут: ListView (история), кнопка смены темы, кнопка кликера, текстовое поле (количество нажатий):

![alt text](https://github.com/IoIdude/FlutterClicker/blob/main/pref/6.png)

#### Результат работы кликера:

![alt text](https://github.com/IoIdude/FlutterClicker/blob/main/pref/7.png)

#### При уходе числа в минус - с каждым последующим числом будет меняться его цвет:

![alt text](https://github.com/IoIdude/FlutterClicker/blob/main/pref/8.png)

#### Результат работы смены темы:

![alt text](https://github.com/IoIdude/FlutterClicker/blob/main/pref/9.png)

### Вывод: в ходе парктической работы я создал проект с использованием Cubit. Реализовал счетчик при нажатии на кнопку + и при нажатии на кнопку -. Реализовал смену темы и историю нажатий и смен тем.
