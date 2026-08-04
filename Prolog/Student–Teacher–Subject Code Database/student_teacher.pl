% Student Database
student(101, rahul).
student(102, priya).
student(103, anil).
student(104, sneha).

% Teacher Database
teacher(t101, kumar).
teacher(t102, sharma).
teacher(t103, mehta).

% Subject Database
subject(cs101, 'Artificial Intelligence').
subject(cs102, 'Database Management').
subject(cs103, 'Computer Networks').

% Teacher teaches Subject
teaches(kumar, cs101).
teaches(sharma, cs102).
teaches(mehta, cs103).

% Student enrolled in Subject
enrolled(rahul, cs101).
enrolled(priya, cs102).
enrolled(anil, cs101).
enrolled(sneha, cs103).
