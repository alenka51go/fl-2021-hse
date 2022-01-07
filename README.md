Работа представляет pазработка конкретного синтаксиса языка по заданному абстрактному синтаксису языка L, реализации для него синтаксического анализатора. 


Описание конкретного синтаксиса языка L: 


Программа ожидает на вход последовательность функций, последняя из которых - функция-точка-входа. 
Имя main является зарезервированным. Может использоваться только в контексте функции-точки-входа.

Пробельные символы разрешены в любых количествах между операторами, ключевыми словами, идентификаторами. 
Поддерживаются однострочные комментарии, начинающися с символов: ##. Комментарии разрешены только между функциями. 

Функция описывается следующим образом:
	имя (произвольное число аргуметов, разделенных ",") {тело}

Имя - переменная
Аргумент - переменная
Тело - последовательность произвольного числа операторов

Переменная: [a-zA-Z][a-zA-Z0-9]*

Литералы языка:
	Числовые:
		Десятичные: ([1-9][0-9]* | 0)
		Двоичные:   (0b1[0-1]*   | 0b0)
	Строковые:  <<[a-zA-Z]+>>

Операторы: 
	Пустой оператор:                   skip;
	Условный оператор:                 if (выражение) {тело}; 
	Условный оператор с двумя ветками: if (выражение) {тело} else {тело};
	Оператор цикла с предусловием:     for (выражение) {тело};
	Оператор связывания:               переменная = выражение;
	Вызов функции:                     переменная (произвольное число аргуметов, разделенных ",");


/*Следующий блок посвящен описанию возможных структур и операций в выражениях*/

Выражение:
	t1 || выражение                          
	t1

t1: t1 && t2                              
	t2                                       
  
t2: !t3                                 
	t3                                     
  
t3: t4 == t3                        
	t4 != t3                      
	t4 > t3                                
	t4 < t3                                 
	t4 >= t3                            
	t4 <= t3                               
	t4                                        
  
t4: t5 - t4                              
	t5 + t4                                
	t5                                        
  
t5: t6 * t5                            
	t6 / t5                                 
	t6                                       
  
t6: -t7                                
	t7                                       
  
t7: t7 ^ t8                               
	t8                                        
  
t8: Литералы
	Переменные
	Вызовы функций    

-----------------------------------------------------

Тесты хранятся в папке [tests/](tests/). Для запуска определенного теста, необходимо запустить скрипт [run.sh](run.sh) с именем теста и форматом вывода ответа. В качестве формата вывода поддерживается два режима: 
- реккурсивный обход дерева абстрактного синатксиса 	
	Node (type: _, children: _)
	/*Не самый наглядный, но описывающий структуру*/
- cписок смежности дерева
	v:NUM (TYPE) --------->  v:NUM (TYPE), ...
	/*Намного более удобный в отладке*/                   
	
