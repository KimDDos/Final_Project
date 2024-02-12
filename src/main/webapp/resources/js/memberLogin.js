

function oauthSignIn(){
  const oauth2Endpoint = 'https://accounts.google.com/o/oauth2/v2/auth';

  let form = document.createElement('form');
  form.setAttribute('method','GET');
  form.setAttribute('action', oauth2Endpoint);

  let param = {
    'client_id': '49862145305-0geotprdm2qk77cu2ta4gu6014s7nc3v.apps.googleusercontent.com',
    'redirect_uri': 'https://localhost:8088/google/login',
    'response_type': 'token',
    'scope': 'https://www.googleapis.com/auth/drive.metadata.readonly',
    'include_granted_scopes': 'true',
    'state': 'pass-through value'
  }

  for (var p in params) {
    var input = document.createElement('input');
    input.setAttribute('type', 'hidden');
    input.setAttribute('name', p);
    input.setAttribute('value', params[p]);
    form.appendChild(input);
  }

  document.body.appendChild(form);
  form.submit();
}