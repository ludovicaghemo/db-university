-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT *
FROM `students`
JOIN `degrees`
ON `students` . `degree_id` = `degrees` . `id`
WHERE `degrees` . `name` = "Corso di Laurea in Economia"
ORDER BY `students`.`id`;

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT *
FROM `degrees`
JOIN `departments` 
ON `degrees`.`department_id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze"
AND `degrees`.`level`= "Magistrale";

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`name`, `teachers`.`name`, `teachers`.`surname`
FROM `courses`
JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers` . `id` = 44; 

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students` . `surname`, `students`.`name`, `degrees`.*, `departments`.*
FROM `students` 
JOIN `degrees`
ON `students` . `degree_id` = `degrees` . `id`
JOIN `departments` 
ON `degrees` . `department_id` = `departments` . `id`
ORDER BY  `students` . `surname`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` as `cdl_name`, `courses`.`name` as `course`, `teachers`.`surname`, `teachers`.`name`,
FROM `teachers` 
JOIN `course_teacher`
ON `course_teacher` . `teacher_id` = `teachers` . `id`
JOIN `courses`
ON `course_teacher` . `course_id` = `courses` . `id`
JOIN `degrees`
ON `courses` . `degree_id` = `degrees` . `id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `departments` . `name`, `teachers` . `name`, `teachers` . `surname`
FROM `teachers` 
JOIN `course_teacher`
ON `course_teacher` . `teacher_id` = `teachers` . `id`
JOIN `courses`
ON `course_teacher`.`course_id` = `courses` . `id`
JOIN `degrees`
ON `courses` . `degree_id` = `degrees` . `id`
JOIN `departments`
ON `degrees` . `department_id` = `departments` . `id`
WHERE `departments` . `name` = 'Dipartimento di Matematica'
ORDER BY `teachers` . `surname`;

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami