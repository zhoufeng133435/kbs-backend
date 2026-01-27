-- 创建数据库
CREATE DATABASE IF NOT EXISTS kb_document DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS kb_vector DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS kb_search DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 使用 kb_document 数据库
USE kb_document;

-- 创建文档表
CREATE TABLE IF NOT EXISTS `document` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(255) NOT NULL COMMENT '文档标题',
  `content` text COMMENT '文档内容',
  `file_path` varchar(500) COMMENT '文件路径',
  `file_size` bigint COMMENT '文件大小(字节)',
  `file_type` varchar(50) COMMENT '文件类型',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态:0-已删除,1-正常',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除:0-未删除,1-已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文档表';

-- 使用 kb_vector 数据库
USE kb_vector;

-- 创建向量记录表
CREATE TABLE IF NOT EXISTS `vector_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `document_id` bigint NOT NULL COMMENT '文档ID',
  `vector_id` varchar(100) COMMENT '向量ID',
  `chunk_index` int COMMENT '文档分块索引',
  `chunk_content` text COMMENT '分块内容',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除:0-未删除,1-已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_document_id` (`document_id`),
  KEY `idx_vector_id` (`vector_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='向量记录表';

-- 使用 kb_search 数据库
USE kb_search;

-- 创建搜索历史表
CREATE TABLE IF NOT EXISTS `search_history` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '历史ID',
  `keyword` varchar(255) NOT NULL COMMENT '搜索关键词',
  `result_count` int COMMENT '结果数量',
  `search_type` varchar(50) COMMENT '搜索类型:keyword-关键词,semantic-语义',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除:0-未删除,1-已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_keyword` (`keyword`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='搜索历史表';

