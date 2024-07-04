/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     03/07/2024 11:25:39                          */
/*==============================================================*/


drop index FALLECIDO_CAUSAMUERTE_FK;

drop index CAUSA_MUERTE_PK;

drop table CAUSA_MUERTE;

drop index CLIENTE_PK;

drop table CLIENTE;

drop index PROFESIONAL_EMPLEADO_FK;

drop index EMPLEADO_PK;

drop table EMPLEADO;

drop index RESERVA_FACTURA_FK;

drop index FACTURA_PK;

drop table FACTURA;

drop index RESERVA_FALLECIDO_FK;

drop index FALLECIDO_PK;

drop table FALLECIDO;

drop index EMPLEADO_PROFESIONAL_FK;

drop index PROFESIONAL_REGISTRADO_PK;

drop table PROFESIONAL_REGISTRADO;

drop index VELATORIO_RESERVA_FK;

drop index FALLECIDO_RESERVA_FK;

drop index CLIENTE_RESERVA_FK;

drop index EMPLEADO_RESERVA_FK;

drop index RESERVA_DETALLE_PK;

drop table RESERVA_DETALLE;

drop index RESERVA_SERVICIO_FK;

drop index SERVICIO_PK;

drop table SERVICIO;

drop index EMPLEADO_TIPOEMPLEADO_FK;

drop index TIPO_EMPLEADO_PK;

drop table TIPO_EMPLEADO;

drop index VELATORIO_PK;

drop table VELATORIO;

/*==============================================================*/
/* Table: CAUSA_MUERTE                                          */
/*==============================================================*/
create table CAUSA_MUERTE (
   ID_CAUSA_MUERTE      INT4                 not null,
   ID_FALLECIDO         INT4                 not null,
   CANCER               VARCHAR(2)           null,
   PULOMNIA             VARCHAR(2) 		  null,
   DERRAME              VARCHAR(2)           null,
   PARO_CARDIACO        VARCHAR(2)           null,
   OTRO                 VARCHAR(50)          null,
   constraint PK_CAUSA_MUERTE primary key (ID_CAUSA_MUERTE)
);

/*==============================================================*/
/* Index: CAUSA_MUERTE_PK                                       */
/*==============================================================*/
create unique index CAUSA_MUERTE_PK on CAUSA_MUERTE (
ID_CAUSA_MUERTE
);

/*==============================================================*/
/* Index: FALLECIDO_CAUSAMUERTE_FK                              */
/*==============================================================*/
create  index FALLECIDO_CAUSAMUERTE_FK on CAUSA_MUERTE (
ID_FALLECIDO
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   NOMBRE_CLIENTE       VARCHAR(50)          null,
   APELLIDO_CLIENTE     VARCHAR(50)          null,
   NUMERO_CELULAR_CLIENTE VARCHAR(10)          null,
   CEDULA_CLIENTE       VARCHAR(10)          null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   ID_EMPLEADO          INT4                 not null,
   ID_PROFESIONAL       INT4                 null,
   NOMBRE_EMPLEADO      VARCHAR(50)          null,
   APELLIDO_EMPLEADO    VARCHAR(50)          null,
   DIRECCION_EMPLEADO   VARCHAR(50)          null,
   FNACIMIENTO_EMPLEADO DATE                 null,
   FINGRESO_LABORAL_EMPLEADO DATE                 null,
   NUMERO_TELEFONO_EMPLEADO VARCHAR(10)          null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
ID_EMPLEADO
);

/*==============================================================*/
/* Index: PROFESIONAL_EMPLEADO_FK                               */
/*==============================================================*/
create  index PROFESIONAL_EMPLEADO_FK on EMPLEADO (
ID_PROFESIONAL
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           INT4                 not null,
   ID_RESERVA           INT4                 not null,
   FECHA_FACTURA        DATE                 null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Index: RESERVA_FACTURA_FK                                    */
/*==============================================================*/
create  index RESERVA_FACTURA_FK on FACTURA (
ID_RESERVA
);

/*==============================================================*/
/* Table: FALLECIDO                                             */
/*==============================================================*/
create table FALLECIDO (
   ID_FALLECIDO         INT4                 not null,
   ID_RESERVA           INT4                 null,
   NOMBRE_FALLECIDO     VARCHAR(50)          null,
   APELLIDO_FALLECIDO   VARCHAR(50)          null,
   SEXO_FALLECIDO       VARCHAR(50)          null,
   FECHANACIMIENTO_FALLECIDO DATE                 null,
   DIFUNCION_FALLECIDO  VARCHAR(50)          null,
   HORADIFUNCION_FALLECIDO TIME                 null,
   HORAEMBALSAMIENTO_FALLECIDO TIME                 null,
   constraint PK_FALLECIDO primary key (ID_FALLECIDO)
);

/*==============================================================*/
/* Index: FALLECIDO_PK                                          */
/*==============================================================*/
create unique index FALLECIDO_PK on FALLECIDO (
ID_FALLECIDO
);

/*==============================================================*/
/* Index: RESERVA_FALLECIDO_FK                                  */
/*==============================================================*/
create  index RESERVA_FALLECIDO_FK on FALLECIDO (
ID_RESERVA
);

/*==============================================================*/
/* Table: PROFESIONAL_REGISTRADO                                */
/*==============================================================*/
create table PROFESIONAL_REGISTRADO (
   ID_PROFESIONAL       INT4                 not null,
   ID_EMPLEADO          INT4                 null,
   EMBALSAMIENTO_PROFESIONAL VARCHAR(50)          null,
   MAQUILLAJE_PROFESIONAL VARCHAR(50)          null,
   constraint PK_PROFESIONAL_REGISTRADO primary key (ID_PROFESIONAL)
);

/*==============================================================*/
/* Index: PROFESIONAL_REGISTRADO_PK                             */
/*==============================================================*/
create unique index PROFESIONAL_REGISTRADO_PK on PROFESIONAL_REGISTRADO (
ID_PROFESIONAL
);

/*==============================================================*/
/* Index: EMPLEADO_PROFESIONAL_FK                               */
/*==============================================================*/
create  index EMPLEADO_PROFESIONAL_FK on PROFESIONAL_REGISTRADO (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: RESERVA_DETALLE                                       */
/*==============================================================*/
create table RESERVA_DETALLE (
   ID_RESERVA           INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_FALLECIDO         INT4                 not null,
   ID_VELATORIO         INT4                 not null,
   OBSERVACION_RESERVA  VARCHAR(100)         null,
   FECHA_RESERVA        DATE                 null,
   HORA_RESERVA         TIME                 null,
   constraint PK_RESERVA_DETALLE primary key (ID_RESERVA)
);

/*==============================================================*/
/* Index: RESERVA_DETALLE_PK                                    */
/*==============================================================*/
create unique index RESERVA_DETALLE_PK on RESERVA_DETALLE (
ID_RESERVA
);

/*==============================================================*/
/* Index: EMPLEADO_RESERVA_FK                                   */
/*==============================================================*/
create  index EMPLEADO_RESERVA_FK on RESERVA_DETALLE (
ID_EMPLEADO
);

/*==============================================================*/
/* Index: CLIENTE_RESERVA_FK                                    */
/*==============================================================*/
create  index CLIENTE_RESERVA_FK on RESERVA_DETALLE (
ID_CLIENTE
);

/*==============================================================*/
/* Index: FALLECIDO_RESERVA_FK                                  */
/*==============================================================*/
create  index FALLECIDO_RESERVA_FK on RESERVA_DETALLE (
ID_FALLECIDO
);

/*==============================================================*/
/* Index: VELATORIO_RESERVA_FK                                  */
/*==============================================================*/
create  index VELATORIO_RESERVA_FK on RESERVA_DETALLE (
ID_VELATORIO
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          INT4                 not null,
   ID_RESERVA           INT4                 null,
   ACOMPANANTEMUSICAL_VELATORIO VARCHAR(2)           null,
   COMIDA_VELATORIO     VARCHAR(2)           null,
   TRANSPORTECEMENTERIO_VELATORIO VARCHAR(2)           null,
   VENTAATAUD_VELATORIO VARCHAR(2)           null,
   MAQUINACAFE_VELATORIO VARCHAR(2)           null,
   COSTO                FLOAT(2)               null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
ID_SERVICIO
);

/*==============================================================*/
/* Index: RESERVA_SERVICIO_FK                                   */
/*==============================================================*/
create  index RESERVA_SERVICIO_FK on SERVICIO (
ID_RESERVA
);

/*==============================================================*/
/* Table: TIPO_EMPLEADO                                         */
/*==============================================================*/
create table TIPO_EMPLEADO (
   ID_TIPOEMPLEADO      INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   DESCRIPCION_TIPOEMPLEADO VARCHAR(255)         null,
   constraint PK_TIPO_EMPLEADO primary key (ID_TIPOEMPLEADO)
);

/*==============================================================*/
/* Index: TIPO_EMPLEADO_PK                                      */
/*==============================================================*/
create unique index TIPO_EMPLEADO_PK on TIPO_EMPLEADO (
ID_TIPOEMPLEADO
);

/*==============================================================*/
/* Index: EMPLEADO_TIPOEMPLEADO_FK                              */
/*==============================================================*/
create  index EMPLEADO_TIPOEMPLEADO_FK on TIPO_EMPLEADO (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: VELATORIO                                             */
/*==============================================================*/
create table VELATORIO (
   ID_VELATORIO         INT4                 not null,
   DIMENSIONES_VELATORIO VARCHAR(100)         null,
   DIRECCION_VELATORIO  VARCHAR(30)          null,
   CAPACIDAD_VELATORIO  INT4                 null,
   HORARESERVA_VELATORIO TIME                 null,
   constraint PK_VELATORIO primary key (ID_VELATORIO)
);

/*==============================================================*/
/* Index: VELATORIO_PK                                          */
/*==============================================================*/
create unique index VELATORIO_PK on VELATORIO (
ID_VELATORIO
);

alter table CAUSA_MUERTE
   add constraint FK_CAUSA_MU_FALLECIDO_FALLECID foreign key (ID_FALLECIDO)
      references FALLECIDO (ID_FALLECIDO)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_PROFESION_PROFESIO foreign key (ID_PROFESIONAL)
      references PROFESIONAL_REGISTRADO (ID_PROFESIONAL)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_RESERVA_F_RESERVA_ foreign key (ID_RESERVA)
      references RESERVA_DETALLE (ID_RESERVA)
      on delete restrict on update restrict;

alter table FALLECIDO
   add constraint FK_FALLECID_RESERVA_F_RESERVA_ foreign key (ID_RESERVA)
      references RESERVA_DETALLE (ID_RESERVA)
      on delete restrict on update restrict;

alter table PROFESIONAL_REGISTRADO
   add constraint FK_PROFESIO_EMPLEADO__EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table RESERVA_DETALLE
   add constraint FK_RESERVA__CLIENTE_R_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table RESERVA_DETALLE
   add constraint FK_RESERVA__EMPLEADO__EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table RESERVA_DETALLE
   add constraint FK_RESERVA__FALLECIDO_FALLECID foreign key (ID_FALLECIDO)
      references FALLECIDO (ID_FALLECIDO)
      on delete restrict on update restrict;

alter table RESERVA_DETALLE
   add constraint FK_RESERVA__VELATORIO_VELATORI foreign key (ID_VELATORIO)
      references VELATORIO (ID_VELATORIO)
      on delete restrict on update restrict;

alter table SERVICIO
   add constraint FK_SERVICIO_RESERVA_S_RESERVA_ foreign key (ID_RESERVA)
      references RESERVA_DETALLE (ID_RESERVA)
      on delete restrict on update restrict;

alter table TIPO_EMPLEADO
   add constraint FK_TIPO_EMP_EMPLEADO__EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;




/*INSERCIÓN DE DATOS*/
INSERT INTO CAUSA_MUERTE (ID_CAUSA_MUERTE, ID_FALLECIDO, CANCER, PULOMNIA, DERRAME, PARO_CARDIACO, OTRO) VALUES
(1, 1, 'D', 'N', 'D', 'B', 'Enfermedad crónica'),
(2, 2, 'N', 'N', 'D', 'D', 'Accidente de tráfico'),
(3, 3, 'D', 'B', 'N', 'D', 'Causa desconocida'),
(4, 4, 'B', 'D', 'N', 'N', 'Complicaciones quirúrgicas'),
(5, 5, 'N', 'D', 'D', 'N', 'Infarto agudo');


INSERT INTO CLIENTE (ID_CLIENTE, NOMBRE_CLIENTE, APELLIDO_CLIENTE, NUMERO_CELULAR_CLIENTE, CEDULA_CLIENTE) VALUES
(1, 'Byron', 'Calderón', '1234567891', '1234567891'),
(2, 'Juan', 'Pérez', '1234567892', '1234567892'),
(3, 'Ana', 'Gómez', '1234567893', '1234567893'),
(4, 'María', 'López', '1234567894', '1234567894'),
(5, 'Pedro', 'Ramírez', '1234567895', '1234567895');


INSERT INTO EMPLEADO (ID_EMPLEADO, ID_PROFESIONAL, NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, DIRECCION_EMPLEADO, FNACIMIENTO_EMPLEADO, FINGRESO_LABORAL_EMPLEADO, NUMERO_TELEFONO_EMPLEADO) VALUES
(1, 1, 'Carlos', 'Martínez', 'Calle 1', '1980-01-01', '2020-01-01', '0987654321'),
(2, 2, 'Luis', 'Rodríguez', 'Calle 2', '1985-02-02', '2021-02-02', '0987654322'),
(3, 3, 'Elena', 'García', 'Calle 3', '1990-03-03', '2022-03-03', '0987654323'),
(4, 4, 'Miguel', 'Hernández', 'Calle 4', '1995-04-04', '2023-04-04', '0987654324'),
(5, 5, 'Laura', 'Sánchez', 'Calle 5', '2000-05-05', '2024-05-05', '0987654325');


INSERT INTO FACTURA (ID_FACTURA, ID_RESERVA, FECHA_FACTURA) VALUES
(1, 1, '2024-07-01'),
(2, 2, '2024-07-02'),
(3, 3, '2024-07-03'),
(4, 4, '2024-07-04'),
(5, 5, '2024-07-05');

INSERT INTO FALLECIDO (ID_FALLECIDO, ID_RESERVA, NOMBRE_FALLECIDO, APELLIDO_FALLECIDO, SEXO_FALLECIDO, FECHANACIMIENTO_FALLECIDO, DIFUNCION_FALLECIDO, HORADIFUNCION_FALLECIDO, HORAEMBALSAMIENTO_FALLECIDO) VALUES
(1, 1, 'José', 'Díaz', 'M', '1950-01-01', '2024-06-01', '10:00:00', '12:00:00'),
(2, 2, 'María', 'Ruiz', 'F', '1960-02-02', '2024-06-02', '11:00:00', '13:00:00'),
(3, 3, 'Pedro', 'Hernández', 'M', '1970-03-03', '2024-06-03', '12:00:00', '14:00:00'),
(4, 4, 'Ana', 'Santos', 'F', '1980-04-04', '2024-06-04', '13:00:00', '15:00:00'),
(5, 5, 'Laura', 'Morales', 'F', '1990-05-05', '2024-06-05', '14:00:00', '16:00:00');


INSERT INTO PROFESIONAL_REGISTRADO (ID_PROFESIONAL, ID_EMPLEADO, EMBALSAMIENTO_PROFESIONAL, MAQUILLAJE_PROFESIONAL) VALUES
(1, 1, 'D', 'N'),
(2, 2, 'N', 'D'),
(3, 3, 'D', 'D'),
(4, 4, 'N', 'B'),
(5, 5, 'B', 'N');


INSERT INTO RESERVA_DETALLE (ID_RESERVA, ID_EMPLEADO, ID_CLIENTE, ID_FALLECIDO, ID_VELATORIO, OBSERVACION_RESERVA, FECHA_RESERVA, HORA_RESERVA) VALUES
(1, 1, 1, 1, 1, 'Observación 1', '2024-07-01', '10:00:00'),
(2, 2, 2, 2, 2, 'Observación 2', '2024-07-02', '11:00:00'),
(3, 3, 3, 3, 3, 'Observación 3', '2024-07-03', '12:00:00'),
(4, 4, 4, 4, 4, 'Observación 4', '2024-07-04', '13:00:00'),
(5, 5, 5, 5, 5, 'Observación 5', '2024-07-05', '14:00:00');


INSERT INTO SERVICIO (ID_SERVICIO, ID_RESERVA, ACOMPANANTEMUSICAL_VELATORIO, COMIDA_VELATORIO, TRANSPORTECEMENTERIO_VELATORIO, VENTAATAUD_VELATORIO, MAQUINACAFE_VELATORIO, COSTO) VALUES
(1, 1, 'D', 'N', 'D', 'B', 'D', 100.50),
(2, 2, 'N', 'D', 'N', 'D', 'N', 200.75),
(3, 3, 'D', 'D', 'B', 'N', 'B', 300.00),
(4, 4, 'N', 'B', 'D', 'N', 'D', 150.25),
(5, 5, 'B', 'N', 'N', 'D', 'N', 250.60);


INSERT INTO TIPO_EMPLEADO (ID_TIPOEMPLEADO, ID_EMPLEADO, DESCRIPCION_TIPOEMPLEADO) VALUES
(1, 1, 'Administrador'),
(2, 2, 'Embalsamador'),
(3, 3, 'Maquillador'),
(4, 4, 'Asistente'),
(5, 5, 'Chofer');


INSERT INTO VELATORIO (ID_VELATORIO, DIMENSIONES_VELATORIO, DIRECCION_VELATORIO, CAPACIDAD_VELATORIO, HORARESERVA_VELATORIO) VALUES
(1, '10x10', 'Calle 1', 50, '10:00:00'),
(2, '15x15', 'Calle 2', 75, '11:00:00'),
(3, '20x20', 'Calle 3', 100, '12:00:00'),
(4, '25x25', 'Calle 4', 125, '13:00:00'),
(5, '30x30', 'Calle 5', 150, '14:00:00');


/*consultas*/
/*==============================================================*/

/*El tiempo promedio transcurrido entre la defunción y el embalsamamiento de difuntos.*/
/*AVG funcion para sacar promedios*/
SELECT 
  AVG (fallecido.HORADIFUNCION_FALLECIDO) as Hora_Difucion, 
  AVG (fallecido.HORAEMBALSAMIENTO_FALLECIDO) as Hora_Embalsamiento
  FROM 
  public.fallecido;
/*==============================================================*/
/*==============================================================*/
/*Cantidad de veces por cada sala de velación en donde se alquile el espacio y no se venda el ataúd.*/
SELECT 
  reserva_detalle.id_velatorio,
  COUNT(servicio.VENTAATAUD_VELATORIO) AS cantidad_de_veces
FROM 
  public.reserva_detalle 
  INNER JOIN public.servicio ON reserva_detalle.id_reserva = servicio.id_reserva
GROUP BY 
  reserva_detalle.id_velatorio
LIMIT 10;

/*==============================================================*/
/*==============================================================*/
/*Suma total de cada causa de defunción.*/
SELECT 
  count(causa_muerte.CANCER) AS CANCER, 
  count(causa_muerte.PULOMNIA) AS PULMONIA, 
  count(causa_muerte.DERRAME) AS DERRAME, 
  count(causa_muerte.PARO_CARDIACO) AS PAROCARDIACO
FROM 
  public.fallecido
  INNER JOIN public.causa_muerte ON fallecido.ID_FALLECIDO = causa_muerte.ID_FALLECIDO;
