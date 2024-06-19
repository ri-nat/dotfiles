function prompt_hostname --description 'short hostname for the prompt'
    set current_hostname (hostname)
    string replace -r "\..*" "" $current_hostname
end
