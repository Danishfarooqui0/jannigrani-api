CREATE TABLE complaints (
    id BIGINT NOT NULL AUTO_INCREMENT,
    complaint_number VARCHAR(30) NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(100) NOT NULL,
    ward_name VARCHAR(150) NOT NULL,
    address VARCHAR(500),
    latitude DECIMAL(10, 7),
    longitude DECIMAL(10, 7),
    status VARCHAR(30) NOT NULL DEFAULT 'SUBMITTED',
    priority VARCHAR(20) NOT NULL DEFAULT 'MEDIUM',
    submitted_by BIGINT,
    assigned_to BIGINT,
    resolution_note TEXT,
    resolved_at DATETIME,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    UNIQUE KEY uk_complaint_number (complaint_number),
    KEY idx_complaints_status (status),
    KEY idx_complaints_ward (ward_name),
    KEY idx_complaints_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE complaint_media (
    id BIGINT NOT NULL AUTO_INCREMENT,
    complaint_id BIGINT NOT NULL,
    media_type VARCHAR(20) NOT NULL,
    file_path VARCHAR(1000) NOT NULL,
    uploaded_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    KEY idx_media_complaint_id (complaint_id),

    CONSTRAINT fk_media_complaint
        FOREIGN KEY (complaint_id)
        REFERENCES complaints(id)
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
