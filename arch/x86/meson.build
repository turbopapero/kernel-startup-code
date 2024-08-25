kernel_linker_script = configure_file(
    copy: true,
    input: 'linker.ld',
    output: 'linker.ld'
)
arch_include = include_directories('include')
arch_src = files(
    'src/multiboot.S',
    'src/start.S',
    'src/uart.c',
)
