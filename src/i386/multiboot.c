#include "multiboot.h"

// struct multiboot_tag {
//     uint32_t type;
//     uint32_t size;
// };

// struct multiboot_info {
//     uint32_t total_size;
//     uint32_t reserved;
//     struct multiboot_tag tags[0];
// };

multiboot_header multiboot __attribute__((section(".multiboot"))) = {
    .magic = MULTIBOOT_HEADER_MAGIC  //
};
