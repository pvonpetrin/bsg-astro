-- CreateTable
CREATE TABLE `Neighborhood` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `name` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `internalNotes` TEXT NULL,
    `active` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Place` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `name` VARCHAR(255) NULL,
    `address1` VARCHAR(255) NULL,
    `address2` VARCHAR(255) NULL,
    `city` VARCHAR(255) NULL DEFAULT 'San Francisco',
    `zip5` VARCHAR(5) NULL,
    `phone` VARCHAR(25) NULL,
    `description` TEXT NULL,
    `longDescription` TEXT NULL,
    `internalNotes` TEXT NULL,
    `active` BOOLEAN NOT NULL DEFAULT false,
    `lat` DOUBLE NULL,
    `lng` DOUBLE NULL,
    `slug` VARCHAR(255) NOT NULL,
    `url` TEXT NULL,
    `hoursText` VARCHAR(255) NULL,

    UNIQUE INDEX `Place_slug_key`(`slug`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PlaceType` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `name` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `internalNotes` TEXT NULL,
    `active` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Trait` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `internalNotes` TEXT NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `exclude` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `Trait_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_PlaceToNeighborhood` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_PlaceToNeighborhood_AB_unique`(`A`, `B`),
    INDEX `_PlaceToNeighborhood_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_PlaceToTrait` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_PlaceToTrait_AB_unique`(`A`, `B`),
    INDEX `_PlaceToTrait_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_PlaceToPlaceType` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_PlaceToPlaceType_AB_unique`(`A`, `B`),
    INDEX `_PlaceToPlaceType_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_PlaceToNeighborhood` ADD CONSTRAINT `_PlaceToNeighborhood_A_fkey` FOREIGN KEY (`A`) REFERENCES `Neighborhood`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_PlaceToNeighborhood` ADD CONSTRAINT `_PlaceToNeighborhood_B_fkey` FOREIGN KEY (`B`) REFERENCES `Place`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_PlaceToTrait` ADD CONSTRAINT `_PlaceToTrait_A_fkey` FOREIGN KEY (`A`) REFERENCES `Place`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_PlaceToTrait` ADD CONSTRAINT `_PlaceToTrait_B_fkey` FOREIGN KEY (`B`) REFERENCES `Trait`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_PlaceToPlaceType` ADD CONSTRAINT `_PlaceToPlaceType_A_fkey` FOREIGN KEY (`A`) REFERENCES `Place`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_PlaceToPlaceType` ADD CONSTRAINT `_PlaceToPlaceType_B_fkey` FOREIGN KEY (`B`) REFERENCES `PlaceType`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

