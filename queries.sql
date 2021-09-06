-- 1.
SELECT
    a.nome
FROM aluno AS a
JOIN aluno_turma at ON at.aluno_id = a.id
JOIN turma t ON t.id = at.turma_id
JOIN professor p ON t.professor_id = p.id
WHERE p.nome = 'JOAO PEDRO';

-- 2.
SELECT
    t.dia_da_semana
FROM turma AS t
JOIN disciplina d ON t.disciplina_id = d.id
WHERE d.nome = 'MATEMATICA';

-- 3.
SELECT
    a.id,
    a.nome,
    array_agg(d.nome) AS disciplinas
FROM aluno AS a
JOIN aluno_turma AS at ON a.id = at.aluno_id
JOIN turma AS t ON t.id = at.turma_id
JOIN disciplina AS d ON t.disciplina_id = d.id
GROUP BY a.id, a.nome
HAVING count(*) FILTER (WHERE d.nome = 'MATEMATICA') > 0
    AND count(*) FILTER (WHERE d.nome = 'FISICA') > 0;

-- 4.
SELECT
    d.*, t.*
FROM disciplina AS d
LEFT JOIN turma AS t ON t.disciplina_id = d.id
WHERE t.disciplina_id IS NULL;

-- 5.
SELECT
    a.id,
    a.nome,
    array_agg(d.nome) AS disciplinas
FROM aluno AS a
JOIN aluno_turma AS at ON a.id = at.aluno_id
JOIN turma AS t ON t.id = at.turma_id
JOIN disciplina AS d ON t.disciplina_id = d.id
GROUP BY a.id, a.nome
HAVING count(*) FILTER (WHERE d.nome = 'MATEMATICA') > 0
    AND count(*) FILTER (WHERE d.nome = 'QUIMICA') = 0;
