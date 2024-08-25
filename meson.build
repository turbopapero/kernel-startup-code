
project(
    'kernel-startup-code', 
    'c', 
    version: '0.1',
    license: 'mit'
)

# General configuration data
version_conf_data = configuration_data()
version_conf_data.set_quoted('auser_version', meson.project_version())
configure_file(output : 'version.h', configuration : version_conf_data)

# Configure with the proper architecture
supported_arch = {
    'x86' : 'x86',
    'x86_64' : 'x86'
}
arch = host_machine.cpu()
assert(supported_arch.has_key(arch), 'Unsupported Architecture')
subdir(join_paths('arch', supported_arch[arch]))

# Kernel Binary
subdir('kernel')
kernel_binary = executable(
    'auser-kernel', 
    arch_src,
    kernel_src,
    include_directories : [
        include_directories('.'),
        arch_include
    ],
    link_args : ['-T', '@0@'.format(kernel_linker_script)],
    link_depends : kernel_linker_script
)

# Special Targets
script_path = join_paths(meson.current_source_dir(), 'script')
boot_script_path = join_paths(script_path, 'boot.py')
run_target(
    'boot', 
    depends: kernel_binary,
    command: [
        'python3', 
        boot_script_path, kernel_binary.full_path()
    ]
)
