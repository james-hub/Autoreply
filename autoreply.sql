CREATE TABLE `autoreply_cache` (
  `email_address` varchar(255) CHARACTER SET latin1 NOT NULL,
  `email_recipient` varchar(255) NOT NULL,
  `date_lastsent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_address`,`email_recipient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mailbox_users` (
  `ID_mailbox` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `flag_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `mailbox_username` varchar(45) NOT NULL,
  `mailbox_password` varchar(32) NOT NULL,
  PRIMARY KEY (`ID_mailbox`),
  UNIQUE KEY `idx_mailbox_user_unique` (`mailbox_username`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mailbox_outofoffice` (
  `ID_mailbox` mediumint(8) unsigned NOT NULL,
  `date_begin` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `flag_active` tinyint(1) NOT NULL DEFAULT '0',
  `message_body` mediumtext,
  PRIMARY KEY (`ID_mailbox`),
  KEY `fk_mailbox_outofoffice_mailbox_users1` (`ID_mailbox`),
  CONSTRAINT `fk_mailbox_outofoffice_mailbox_users1` FOREIGN KEY (`ID_mailbox`) REFERENCES `mailbox_users` (`ID_mailbox`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

