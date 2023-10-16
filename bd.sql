CREATE DATABASE IF NOT EXISTS fourhealth;
  
CREATE TABLE `Diagnostico` (
  `Diagnostico` varchar(100) NOT NULL,
  `Exame1` varchar(100) DEFAULT NULL,
  `Exame2` varchar(100) DEFAULT NULL,
  `Exame3` varchar(100) DEFAULT NULL,
  `Exame4` varchar(100) DEFAULT NULL,
  `Exame5` varchar(100) DEFAULT NULL,
  `Exame6` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Diagnostico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO Diagnostico (Diagnostico, Exame1, Exame2, Exame3, Exame4, Exame5, Exame6) 
VALUES 
('HSA (Hemorragia subaracnoidea)', 'TC', 'RM', 'Punção Lombar', NULL, NULL, NULL),
('Aneurisma', 'Doppler', 'TC', 'RM', 'Angiografia', NULL, NULL),
('HIP (hemorragia intraparenquimatosa)', 'TC', 'LCR', NULL, NULL, NULL, NULL),
('TVC (Trombose Venosa central)', 'TC', 'Punção Lombar', 'RM', 'Doppler', NULL, NULL),
('Dissecção', 'TC', 'RM', 'Doppler', NULL, NULL, NULL),
('HSD', 'TC', 'RM', 'Hemograma', NULL, NULL, NULL),
('Hipertensão Intracraniana', 'TC', 'RM', 'Doppler', 'Punção Lombar', 'Hemograma', NULL),
('Neoplasia', 'TC', 'RM', 'Hemograma', NULL, NULL, NULL),
('Abuso de Analgésico', 'Hemograma', 'RM', 'TC', NULL, NULL, NULL),
('Migrânea', 'TC', 'RM', 'Hemograma', NULL, NULL, NULL),
('AVEH', 'TC', 'RM', 'Hemograma', 'Angiografia Cerebral', NULL, NULL),
('Neoplasia de Fossa Posterior', 'TC', 'RM', 'Hemograma', 'Angiografia Cerebral', 'Punção Lombar', NULL),
('Meningite', 'Punção Lombar', 'Hemograma', 'TC', 'RM', 'Hemoculturas', 'Sorologia: HIV'),
('Encefalite', 'Punção Lombar', 'Hemograma', 'TC', 'RM', NULL, NULL),
('Doenças Autoimunes', 'TC', 'RM', 'Punção Lombar', 'VHS', 'PCR', 'Hemograma'),
('Eclâmpsia', 'Hemograma', 'Proteinúria', 'Creatinina sérica', 'Ecografia abdominal', NULL, NULL),
('Rubeola', 'Hemograma', 'RM', 'TC', NULL, NULL, NULL),
('Febre Maculosa', 'Hemograma', 'RM', 'TC', NULL, NULL, NULL),
('Parvovírus B19', 'Hemograma', NULL, NULL, NULL, NULL, NULL),
('Dengue', 'Hemograma', NULL, NULL, NULL, NULL, NULL),
('Chikungunya', 'Hemograma', NULL, NULL, NULL, NULL, NULL),
('Zika', 'Hemograma', NULL, NULL, NULL, NULL, NULL),
('Varicela', 'Hemograma', NULL, NULL, NULL, NULL, NULL),
('Infecção Sistêmica', 'Hemograma', 'exames séricos', 'PCR', 'VHS', 'Provas Autoimunes', NULL),
('Doenças do Colágeno', 'Hemograma', 'PCR', 'VHS', 'RM', NULL, NULL),
('LES com Complicação Neurológica', 'Hemograma', 'RM', 'TC', 'Punção Lombar', NULL, NULL),
('Infecções Oportunistas', 'Hemograma', 'RM', 'TC', 'Punção Lombar', NULL, NULL),
('Abcesso Cerebral', 'RM', 'TC', 'Punção Lombar', NULL, NULL, NULL),
('Metastase', 'RM', 'TC', 'Punção Lombar', NULL, NULL, NULL),
('Arterite temporal', 'PCR', 'VHS', 'RM', 'TC', 'Fundoscopia', NULL),
('Glaucoma', 'PCR', 'VHS', 'RM', 'TC', 'Fundoscopia', NULL),
('AVCH', 'Hemograma', 'RM', 'TC', NULL, NULL, NULL),
('MAV (mal formação arteriovenosa)', 'Angiografia Cerebral', 'RM', 'TC', 'Punção Lombar pós', NULL,);


CREATE TABLE `Exame` (
  `Exame` varchar(100) NOT NULL,
  `Procurar` text,
  PRIMARY KEY (`Exame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO Exame (Exame, Procurar) VALUES
('Tomografia de Crânio', 'A TC é muito sensível para identificação de hemorragias agudas, vistas como lesões hiperdensas, e é considerado o padrão ouro para tal. Sem contraste com ou sem punção liquórica é o exame essencial para o diagnóstico de HSA. A TC realizada nas primeiras 24 horas tem 92% de sensibilidade (> 95% na primeira hora).'),
('Ressonância Magnética', 'Tem sensibilidade similar, mas menos validada na emergência. Se mostra mais útil na suspeita de um aneurisma subagudo, na sequência T2. Principalmente porque após 7 dias a sensibilidade da TC cai para 50%.'),
('Punção Lombar', 'Deve ser realizada em qualquer paciente com suspeita de HSA e resultados negativos ou questionáveis na TC ou RM de crânio; e devem ser coletados quatro tubos para contagem de hemácias. A punção é essencial no diagnóstico de meningite, mas o tratamento não deve ser atrasado por causa do exame e antes da coleta pode ser necessário realizar uma TC para garantir a segurança, pois pacientes com hipertensão craniana grave ou efeito de massa no SNC podem sofrer herniação uncal após punção.'),
('Estudo de vasos cranianos e cervicais', 'Identificar aneurismas, malformações arteriovenosas (MAVs), estenoses ou outras anormalidades vasculares;Avaliar a saúde vascular cerebral e identificar riscos de acidente vascular cerebral ou hemorragia.'),
('VHS', 'Níveis elevados podem indicar a presença de inflamação no corpo, mas não são específicos para uma condição;Auxiliar no monitoramento de doenças inflamatórias crônicas, como artrite reumatoide.'),
('PCR', 'Identificar processos infecciosos, inflamatórios e autoimunes;Acompanhar a resposta ao tratamento de doenças inflamatórias.'),
('Hemograma', 'Identificar anemia, infecções, distúrbios da coagulação ou outras alterações nos glóbulos vermelhos, brancos ou plaquetas;Avaliar a saúde geral e a capacidade do corpo de combater infecções.'),
('Proteinúria', 'Avaliar a função renal e identificar possíveis problemas nos rins ou inflamações; Identificar sinais de doença renal, como glomerulonefrite ou síndrome nefrótica.'),
('Creatinina sérica', 'Identificar problemas renais, que podem ser causados por infecções, doenças renais ou outras condições;monitorar a progressão de doenças renais e a resposta ao tratamento.'),
('Ecografia abdominal', 'Identificar possíveis infecções, inflamações ou outras condições nos órgãos abdominai;Avaliar a saúde de órgãos como fígado, vesícula biliar, rins e baço.'),
('Provas  autoimunes', 'Identificar doenças autoimunes que podem afetar o sistema nervoso e causar sintomas neurológicos; Auxiliar no diagnóstico de condições como lúpus eritematoso sistêmico ou esclerose múltipla.'),
('Exames séricos', 'Identificar desequilíbrios metabólicos ou problemas hepáticos que podem afetar a saúde neurológica;Monitorar a função hepática e metabólica do corpo para prevenir complicações.'),
('Fundoscopia', 'Identificar possíveis problemas neurológicos ou cardiovasculares com base nas alterações visuais;Diagnosticar condições como hipertensão intracraniana ou neuropatias ópticas.'),
('Punção lombar após neuroimagem', 'Identificar possíveis infecções, inflamações ou sangramentos no sistema nervoso central após exames de imagem;Avaliar as características do líquido cefalorraquidiano e auxiliar no diagnóstico de condições neurológicas.');


    
CREATE TABLE `sinais` (
  `sinal_alarme` varchar(100) NOT NULL,
  `Diagnostico1` varchar(100) DEFAULT NULL,
  `Diagnostico2` varchar(100) DEFAULT NULL,
  `Diagnostico3` varchar(100) DEFAULT NULL,
  `Diagnostico4` varchar(100) DEFAULT NULL,
  `Diagnostico5` varchar(100) DEFAULT NULL,
  `Diagnostico6` varchar(100) DEFAULT NULL,
  `Diagnostico7` varchar(100) DEFAULT NULL,
  `Diagnostico8` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sinal_alarme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Populando a tabela 'sinais' com os dados
INSERT INTO sinais (sinal_alarme, Diagnostico1, Diagnostico2, Diagnostico3, Diagnostico4, Diagnostico5, Diagnostico6, Diagnostico7, Diagnostico8)
VALUES
('Mudança do padrão de dor', 'HSA', 'Aneurisma', 'HIP', 'TVC', 'Dissecção', NULL, NULL, NULL),
('Piora progressiva da dor', 'HSD', 'hipertensão intracraniana', 'neoplasia', 'abuso de analgésico', NULL, NULL, NULL, NULL),
('Refratária ao tratamento', 'Migrânea', 'Migrânea', 'hipertensão intracraniana', 'neoplasia', NULL, NULL, NULL, NULL),
('Início súbito', 'HSA', 'Aneurisma', 'HIP', 'TVC', 'Dissecção', 'AVEH', 'neoplasia de fossa posterior', NULL),
('Thunderclap', 'HSA', 'Aneurisma', 'HIP', 'TVC', 'Dissecção', NULL, NULL, NULL),
('Primeiro episódio de cefaleia intensa', 'Aneurisma', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Febre', 'Meningite', 'encefalite', 'doenças autoimunes', 'neoplasia', NULL, NULL, NULL, NULL),
('Toxemia', 'Eclâmpsia', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Rash cutâneo', 'Rubeola', 'febre maculosa', 'parvovírus B19', 'Dengue', 'Chikungunya', 'Zika', 'Varicela', NULL),
('Rigidez de nuca', 'Meningite', 'HSA', NULL, NULL, NULL, NULL, NULL, NULL),
('Emagrecimento', 'Meningite', 'encefalite', 'doenças autoimunes', 'neoplasia', NULL, NULL, NULL, NULL),
('Doenças reumatológicas', 'Infecção sistêmica', 'doenças do colágeno', 'LES com complicação neurológica', NULL, NULL, NULL, NULL, NULL),
('Imunossupressão/HIV', 'Infecções oportunistas', 'abcesso cerebral', 'neoplasia', NULL, NULL, NULL, NULL, NULL),
('Neoplasia', 'Metastase', 'meningite', 'abcesso cerebral', NULL, NULL, NULL, NULL, NULL),
('Início após 50 anos', 'Arterite temporal', 'neoplasia', 'glaucoma', NULL, NULL, NULL, NULL, NULL),
('Déficit focal', 'HSA', 'AVCH', 'Dissecção', 'MAV', 'infecção', 'neoplasia', 'HIP', NULL),
('Papiledema', 'Lesão expansiva', 'hipertensão benigna', 'meningite', NULL, NULL, NULL, NULL, NULL),
('Rebaixamento nível de consciência', 'HSA', 'AVCH', 'Dissecção', 'infecção', 'neoplasia', 'HIP', NULL, NULL),
('Convulsão', 'Eclâmpsia', 'neoplasia', 'meningite', NULL, NULL, NULL, NULL, NULL);



SELECT DISTINCT Diagnostico
FROM (
    SELECT sinal_alarme, Diagnostico1 AS Diagnostico FROM sinais
    UNION ALL
    SELECT sinal_alarme, Diagnostico2 FROM sinais
    UNION ALL
    SELECT sinal_alarme, Diagnostico3 FROM sinais
    UNION ALL
    SELECT sinal_alarme, Diagnostico4 FROM sinais
    UNION ALL
    SELECT sinal_alarme, Diagnostico5 FROM sinais
    UNION ALL
    SELECT sinal_alarme, Diagnostico6 FROM sinais
    UNION ALL
    SELECT sinal_alarme, Diagnostico7 FROM sinais
) AS subquery
WHERE Diagnostico IS NOT NULL
AND sinal_alarme IN ('Déficit focal', 'Convulsão', 'Febre');




SELECT DISTINCT Procurar
FROM Exame
WHERE Exame IN ('Tomografia de Crânio', 'Ressonância Magnética', 'Punção Lombar', 'Hemograma');



SELECT DISTINCT Exame
FROM (
    SELECT Diagnostico AS Diagnostico, Exame1 AS Exame FROM diagnostico
    UNION ALL
    SELECT Diagnostico, Exame2 FROM Diagnostico
    UNION ALL
    SELECT Diagnostico, Exame3 FROM Diagnostico
    UNION ALL
    SELECT Diagnostico, Exame4 FROM Diagnostico
    UNION ALL
    SELECT Diagnostico, Exame5 FROM Diagnostico
    UNION ALL
    SELECT Diagnostico, Exame6 FROM Diagnostico
) AS subquery
WHERE Exame IS NOT NULL
AND Diagnostico IN ('HSA', 'Meningite', 'Neoplasia');
