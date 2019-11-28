BEGIN;

INSERT INTO public_location VALUES (42, 42, 'amadora');
INSERT INTO public_location VALUES (99, 99, 'taguspark');
INSERT INTO public_location VALUES (66, 66, 'alameda');

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
    '31415',
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

INSERT INTO user_table VALUES ('super@user.com', 'admin');

INSERT INTO user_table VALUES ('jose@povinho.com', 'bonitobonito');

INSERT INTO user_table VALUES ('coca@cola.com', 'pepsi');

INSERT INTO qualified_user VALUES ('jose@povinho.com');

INSERT INTO qualified_user VALUES ('coca@cola.com');

INSERT INTO regular_user VALUES ('super@user.com');

INSERT INTO incident VALUES ('00000', '12345', 'super@user.com');

INSERT INTO incident VALUES ('31415', '11111', 'jose@povinho.com');

INSERT INTO incident VALUES ('01010', '22222', 'jose@povinho.com');

INSERT INTO correction_proposal VALUES ('jose@povinho.com');

INSERT INTO correction VALUES ('jose@povinho.com', '00000');

COMMIT;
