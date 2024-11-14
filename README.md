![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)



# Database - Sistema Acadêmico

Este foi um projeto profissional realizado na faculdade que consistiu na criação de um banco de dados para um sistema acadêmico utilizando MySQL.

* Modelo Conceitual:

    ![Modelo Conceitual](/Modelo_Conceitual.jpg "Modelo Conceitual")

* Modelo Lógico:

    ![Modelo Lógico](/Modelo_Lógico.jpg "Modelo Lógico")

* Modelo Físico: [data_base.sql](https://github.com/LarissaRicarte/Project-MySQL-Sistema-Academico/blob/main/data_base.sql)

Além disso, realizamos alguns filtros orientados pelo professor responsável pelo projeto.

1.  Selecionar os alunos de um curso específico.
    ~~~ sql
        SELECT alunos.nome, cursos.nome, alunos.idCurso FROM cursos
        INNER JOIN alunos ON alunos.idCurso = cursos.id
        WHERE cursos.id = x
        -- x = qualquer id de curso
    ~~~

2. Selecionar todos os alunos de uma disciplina específica com nota maior ou igual a 7.
    ~~~ sql
    SELECT alunos.nome, alunos_turmas.nota, turmas.cod_turma, disciplinas.nome as 'disciplina' FROM alunos

    INNER JOIN alunos_turmas ON alunos_turmas.idAluno = alunos.id AND alunos_turmas.nota >= 7

    INNER JOIN turmas ON alunos_turmas.idTurma = turmas.id

    INNER JOIN disciplinas ON turmas.idDisciplina = disciplinas .id

    WHERE disciplinas.id = x

    -- x = qualquer id de disciplina
    ~~~

3. Selecionar todos os professores com salário maior ou igual a 8.000,00.
    ~~~ sql
    SELECT professores.nome, professores.salario FROM professores
    WHERE professores.salario >= 8000.00
    ~~~

4. Selecionar alunos que não estejam matriculados em nenhuma disciplina.
    ~~~ sql
    SELECT alunos.nome, alunos.id FROM alunos
    WHERE (SELECT COUNT(*) FROM alunos_turmas WHERE alunos_turmas.idAluno = alunos.id) = 0
    ~~~