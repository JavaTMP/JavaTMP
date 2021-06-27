INSERT INTO `spring`.`user` (`id`, `username`, `password`, `algorithm`)
VALUES ('1', 'john', '$2a$10$MOpTrrmpLShuVVhmkvh4Q.37WsMv0WylKCJFZKbAybEGESrx.sEgS', 'BCRYPT');

INSERT INTO `spring`.`authority` (`id`, `name`, `user`) VALUES ('1', 'READ', '1');
INSERT INTO `spring`.`authority` (`id`, `name`, `user`) VALUES ('2', 'WRITE', '1');

INSERT INTO `spring`.`product` (`id`, `name`, `price`, `currency`) VALUES ('1', 'Chocolate', '10', 'USD');
commit;
