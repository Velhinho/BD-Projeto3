BEGIN;

INSERT INTO public_location VALUES (420, 420, 'amadora');
INSERT INTO public_location VALUES (999, 999, 'taguspark');
INSERT INTO public_location VALUES (666, 666, 'alameda');

INSERT INTO item VALUES (
    '12345',
    'TEST',
    'amadora',
    420,
    420
);

INSERT INTO item VALUES (
    '11111',
    'ola',
    'taguspark',
    999,
    999
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
    'RUS',
    timestamp '2019-04-05 00:00:00',
    'YA',
    TRUE
);

INSERT INTO translation_anomaly VALUES ('00000', 'right', 'GER');

INSERT INTO user_table VALUES ('super@user.com', 'admin');

INSERT INTO user_table VALUES ('jose@povinho.com', 'bonitobonito');

INSERT INTO user_table VALUES ('coca@cola.com', 'pepsi');

INSERT INTO qualified_user VALUES ('jose@povinho.com');

INSERT INTO qualified_user VALUES ('coca@cola.com');

INSERT INTO regular_user VALUES ('super@user.com');

INSERT INTO incident VALUES ('00000', '12345', 'jose@povinho.com');

INSERT INTO incident VALUES ('11111', '12345', 'jose@povinho.com');

INSERT INTO correction_proposal VALUES ('jose@povinho.com');

INSERT INTO correction VALUES ('jose@povinho.com', '00000');

COMMIT;
