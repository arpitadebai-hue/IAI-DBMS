use dbms_assignment ;
select * from customers ;

create table support_tickets (
    ticket_id char(36) primary key ,
    customer_id char(36) ,
    foreign key (customer_id) references customers(customer_id) , 
    issue_category varchar(80) null ,
    priority varchar(20) ,
    submission_date datetime null ,
    resolution_date datetime null ,
    resolution_status varchar(30) ,
    resolution_time_hours decimal(8,2) ,
    customer_satisfaction_score int null ,
    notes text 
    );
    
desc support_tickets ;
desc customers ;

create table customer_reviews_complete (
     reviews_id varchar(36) primary key ,
     customer_id char(36) ,
     foreign key (customer_id) references customers(customer_id),
     product_name varchar(150) ,
     product_category varchar(80),
     full_name  varchar(100) ,
     transaction_date date ,
     review_date date ,
     rating int null ,
     review_title varchar(255),
     review_text text 
    );

desc customer_reviews_complete ;

use dbms_assignment ;


show create table customers ;
CREATE TABLE customers (
  customer_id varchar(50) NOT NULL,
  full_name varchar(100) DEFAULT NULL,
  age varchar(100) DEFAULT NULL,
  gender varchar(20) DEFAULT NULL,
  email varchar(150) DEFAULT NULL,
  phone varchar(30) DEFAULT NULL,
  street_address varchar(255) DEFAULT NULL,
  city varchar(100) DEFAULT NULL,
  state varchar(100) DEFAULT NULL,
  zip_code varchar(20) DEFAULT NULL,
  registration_date date DEFAULT NULL,
  preferred_channel varchar(30) DEFAULT NULL,
  PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;


show create table transactions ;
CREATE TABLE transactions (
  transaction_id char(36) NOT NULL,
  customer_id char(36) DEFAULT NULL,
  product_name varchar(100) DEFAULT NULL,
  product_category varchar(100) DEFAULT NULL,
  quantity int DEFAULT NULL,
  price decimal(10,2) DEFAULT NULL,
  transaction_date date DEFAULT NULL,
  store_location varchar(100) DEFAULT NULL,
  payment_method varchar(50) DEFAULT NULL,
  discount_applied decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (transaction_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

show create table interactions ;
CREATE TABLE interactions (
  interaction_id char(36) NOT NULL,
  customer_id char(36) DEFAULT NULL,
  channels varchar(50) DEFAULT NULL,
  interaction_type varchar(50) DEFAULT NULL,
  interaction_date datetime DEFAULT NULL,
  duration decimal(8,2) DEFAULT NULL,
  page_or_product varchar(150) DEFAULT NULL,
  session_id varchar(100) DEFAULT NULL,
  PRIMARY KEY (interaction_id),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `interactions_ibfk_1` FOREIGN KEY (customer_id) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

show create table campaigns ;
CREATE TABLE campaigns (
  campaign_id char(36) NOT NULL,
  campaign_name varchar(150) DEFAULT NULL,
  campaign_type varchar(50) DEFAULT NULL,
  start_date date DEFAULT NULL,
  end_date date DEFAULT NULL,
  target_segment varchar(100) DEFAULT NULL,
  budget decimal(12,2) DEFAULT NULL,
  impressions int DEFAULT NULL,
  clicks int DEFAULT NULL,
  conversions int DEFAULT NULL,
  conversion_rate decimal(5,4) DEFAULT NULL,
  roi decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (campaign_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;




