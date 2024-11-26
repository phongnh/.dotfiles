# pytyon3 -m pip install --user virtualfish
# pip3 install --user virtualfish

# if test -s /opt/homebrew/lib/python3.10/site-packages/virtualfish/virtual.fish
#     set -g VIRTUALFISH_VERSION 2.5.5
#     set -g VIRTUALFISH_PYTHON_EXEC /opt/homebrew/opt/python@3.10/bin/python3.10
#     source /opt/homebrew/lib/python3.10/site-packages/virtualfish/virtual.fish
#     emit virtualfish_did_setup_plugins
# else if test -s /usr/local/lib/python3.10/site-packages/virtualfish/virtual.fish
#     set -g VIRTUALFISH_VERSION 2.5.5
#     set -g VIRTUALFISH_PYTHON_EXEC /usr/local/opt/python@3.10/bin/python3.10
#     source /usr/local/lib/python3.10/site-packages/virtualfish/virtual.fish
#     emit virtualfish_did_setup_plugins
# end

# # VirtualFish - pip install virtualfish
# begin
#     if type python3 &>/dev/null
#         eval (python3 -m virtualfish)
#     else if type python &>/dev/null
#         eval (python -m virtualfish)
#     end
# end 2>/dev/null
