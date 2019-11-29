BEGIN;

INSERT INTO public_location VALUES (69, 69, 'kappa');
INSERT INTO public_location VALUES (39.336776, 45, 'ring');
INSERT INTO public_location VALUES (39.336774, 32, 'cova da prima');
INSERT INTO public_location VALUES (39.336775, -8.936379, 'rio maior');
INSERT INTO public_location VALUES (9, 46, 'chelas');
INSERT INTO public_location VALUES (21, 48, 'cacem');
INSERT INTO public_location VALUES (39, 44, 'barcarena');
INSERT INTO public_location VALUES (21, 21, 'massama');
INSERT INTO public_location VALUES (42, 42, 'queluz');
INSERT INTO public_location VALUES (99, 99, 'taguspark');
INSERT INTO public_location VALUES (66, 66, 'alameda');

INSERT INTO item VALUES (
    '98277',
    'SUICIDIO AFTER EXAME DE BD',
    'taguspark',
    99,
    99
);

INSERT INTO item VALUES (
    '98276',
    'EXAME DE BD',
    'taguspark',
    99,
    99
);
INSERT INTO item VALUES (
    '98976',
    'PRIMASSA',
    'cova da prima',
    39.336774,
    32
);

INSERT INTO item VALUES (
    '98986',
    'MUFASSA',
    'kappa',
    69,
    69
);

INSERT INTO item VALUES (
    '67436',
    'foste gamado',
    'cacem',
    21,
    48
);

INSERT INTO item VALUES (
    '79696',
    'Tintol above',
    'ring',
    39.336776,
    45
);

INSERT INTO item VALUES (
    '69699',
    'Tintol2',
    'rio tinto',
    39.336775,
     -8.936379
);

INSERT INTO item VALUES (
    '62316',
    'STK2',
    'chelas',
    9,
    46
);

INSERT INTO item VALUES (
    '69696',
    'STK',
    'chelas',
    9,
    46
);

INSERT INTO item VALUES (
    '00007',
    'Tintol',
    'rio tinto',
    39.336775,
     -8.936379
);

INSERT INTO item VALUES (
    '22365',
    'TEST12',
    'kappa',
    69,
    69
);
INSERT INTO item VALUES (
    '12365',
    'TEST1',
    'barcarena',
    39,
    44
);
INSERT INTO item VALUES (
    '12345',
    'TEST',
    'amadora',
    42,
    42
);

INSERT INTO item VALUES (
    '11111',
    'ola',
    'taguspark',
    99,
    99
);

INSERT INTO item VALUES (
    '22222',
    'Hello',
    'taguspark',
    99,
    99
);

INSERT INTO anomaly VALUES (
    '00000',
    'center',
    'asd.png',
    'ENG',
    timestamp '2019-01-01 00:00:00',
    'TEST',
    FALSE
);

INSERT INTO anomaly VALUES (
    '00001',
    'left',
    'asd.png',
    'ENG',
    timestamp '2019-01-01 00:00:01',
    'TEST2',
    FALSE
);

INSERT INTO anomaly VALUES (
    '00003',
    'center',
    'asd3.png',
    'POR',
    timestamp '2019-01-01 00:10:00',
    'TEST3',
    TRUE
);

INSERT INTO anomaly VALUES (
    '00004',
    'left',
    'asd4.png',
    'POR',
    timestamp '2019-01-01 00:15:00',
    'TEST4',
    TRUE
);

INSERT INTO anomaly VALUES (
    '00005',
    'center',
    'asd4.png',
    'POR',
    timestamp '2020-01-01 00:10:00',
    'TEST2',
    TRUE
);

INSERT INTO anomaly VALUES (
    '00006',
    'center',
    'asd8.png',
    'ITA',
    timestamp '2019-01-01 00:10:00',
    'TEST9',
    FALSE
);

INSERT INTO anomaly VALUES (
    '00010',
    'center',
    'asd9.png',
    'ITA',
    timestamp '2019-10-01 00:10:00',
    'TEST19',
    FALSE
);

INSERT INTO anomaly VALUES (
    '00011',
    'center',
    'asd18.png',
    'ITA',
    timestamp '2019-01-01 00:10:00',
    'TEST9',
    TRUE
);

INSERT INTO anomaly VALUES (
    '00012',
    'center',
    'asd19.png',
    'FRA',
    timestamp '2019-03-01 00:10:00',
    'TEST10',
    TRUE
);


INSERT INTO anomaly VALUES (
    '31415',
    'left',
    'foo.png',
    'ENG',
    timestamp '2019-04-05 00:00:00',
    'YA',
    TRUE
);

INSERT INTO anomaly VALUES (
    '31115',
    'left',
    'foo.png',
    'ENG',
    timestamp '2019-04-05 00:00:00',
    'YA',
    TRUE
);

INSERT INTO anomaly VALUES (
    '01010',
    'left',
    'bar.png',
    'GER',
    timestamp '2018-08-08 00:00:00',
    'Very Bad',
    TRUE
);

INSERT INTO translation_anomaly VALUES ('00000', 'right', 'GER');
INSERT INTO translation_anomaly VALUES ('01010', 'left', 'GER');
INSERT INTO translation_anomaly VALUES ('31415', 'left', 'ENG');
INSERT INTO translation_anomaly VALUES ('00012', 'center', 'FRA');
INSERT INTO translation_anomaly VALUES ('00011', 'center', 'ITA');
INSERT INTO translation_anomaly VALUES ('00006', 'center', 'ITA');

INSERT INTO user_table VALUES ('super@user.com', 'admin');
INSERT INTO user_table VALUES ('super2@user.com', 'admin');
INSERT INTO user_table VALUES ('super3@user.com', 'admin');
INSERT INTO user_table VALUES ('super4@user.com', 'admin');
INSERT INTO user_table VALUES ('super5@user.com', 'admin');
INSERT INTO user_table VALUES ('super6@user.com', 'admin');
INSERT INTO user_table VALUES ('super7@user.com', 'admin');
INSERT INTO user_table VALUES ('super8@user.com', 'admin');
INSERT INTO user_table VALUES ('super9@user.com', 'admin');
INSERT INTO user_table VALUES ('super10@user.com', 'admin');
INSERT INTO user_table VALUES ('jose@povinho.com', 'bonitobonito');
INSERT INTO user_table VALUES ('jose2@povinho.com', 'bonitobonito');
INSERT INTO user_table VALUES ('jose3@povinho.com', 'bonitobonito');
INSERT INTO user_table VALUES ('jose4@povinho.com', 'bonitobonito');
INSERT INTO user_table VALUES ('jose5@povinho.com', 'bonitobonito');
INSERT INTO user_table VALUES ('coca@cola.com', 'pepsi');

INSERT INTO qualified_user VALUES ('jose@povinho.com');
INSERT INTO qualified_user VALUES ('jose2@povinho.com');
INSERT INTO qualified_user VALUES ('jose3@povinho.com');
INSERT INTO qualified_user VALUES ('super@user.com');
INSERT INTO qualified_user VALUES ('super2@user.com');
INSERT INTO qualified_user VALUES ('super3@user.com');
INSERT INTO qualified_user VALUES ('super4@user.com');
INSERT INTO qualified_user VALUES ('coca@cola.com');

INSERT INTO regular_user VALUES ('super5@user.com');
INSERT INTO regular_user VALUES ('super6@user.com');
INSERT INTO regular_user VALUES ('super7@user.com');
INSERT INTO regular_user VALUES ('super8@user.com');
INSERT INTO regular_user VALUES ('super9@user.com');
INSERT INTO regular_user VALUES ('super10@user.com');
INSERT INTO regular_user VALUES ('jose4@povinho.com');
INSERT INTO regular_user VALUES ('jose5@povinho.com');

INSERT INTO incident VALUES ('00000', '12345', 'super@user.com');
INSERT INTO incident VALUES ('00012', '11111', 'super5@user.com');
INSERT INTO incident VALUES ('00006', '62316', 'super2@user.com');
INSERT INTO incident VALUES ('00010', '98986', 'super3@user.com');
INSERT INTO incident VALUES ('00004', '79696', 'super4@user.com');
INSERT INTO incident VALUES ('31415', '11111', 'jose@povinho.com');
INSERT INTO incident VALUES ('01010', '22222', 'jose@povinho.com');

INSERT INTO correction_proposal VALUES (
    'super2@user.com',
    '2019-01-01 00:00:00',
    'corrected'
);

INSERT INTO correction_proposal VALUES (
    'super2@user.com',
    '2019-01-01 00:00:00',
    'corrected2'
);

INSERT INTO correction_proposal VALUES (
    'super2@user.com',
    '2019-01-01 00:00:00',
    'corrected3'
);

INSERT INTO correction_proposal VALUES (
    'super3@user.com',
    '2019-01-01 00:00:00',
    'corrected4'
);

INSERT INTO correction_proposal VALUES (
    'super4@user.com',
    '2019-01-01 00:00:00',
    'corrected5'
);

INSERT INTO correction VALUES ('super2@user.com', '00000');
INSERT INTO correction VALUES ('super2@user.com', '00012');
INSERT INTO correction VALUES ('super2@user.com', '00006');
INSERT INTO correction VALUES ('super3@user.com', '00004');
INSERT INTO correction VALUES ('super4@user.com', '01010');

COMMIT;
