create table if not exists payee (
   user_id      serial primary key,
   email        varchar(255) not null unique,
   name         varchar(255) not null,
   phone_number varchar(20)
);

create table if not exists transactions (
   transaction_id     serial primary key,
   user_id            int
      references payee ( user_id ),
   transaction_amount decimal(10,2) not null,
   merchant           varchar(255),
   country            varchar(50),
   status             varchar(50) not null
);

create table if not exists fraud_scores (
   score_id       serial primary key,
   transaction_id int
      references transactions ( transaction_id ),
   user_id        int
      references payee ( user_id ),
   fraud_score    decimal(5,2) not null,
   risk_level     varchar(50) not null
);