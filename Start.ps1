$GistUrl = Read-Host -Prompt 'Input your Github raw url'
$confirmation = Read-Host "Your url was '$GistUrl'. Is that correct? (Y/N)"
if ($confirmation -eq 'y') {
  # proceed
  START https://boxstarter.org/package/nr/url?$GistUrl
}
