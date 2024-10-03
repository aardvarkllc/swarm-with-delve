# readme

Debug a golang service launched using docker compose or a docker swarm.

[Guide](https://medium.com/@guptaaashutosh/secure-your-apis-with-ory-hydra-a-step-by-step-guide-b6c1f8f66dd9)

```json
{
  "client_id": "8c30a884-fae2-407b-9052-8e6b2041a730",
  "client_name": "",
  "client_secret": "pF78eTIjvqUp5H2PW0Qzp_jESU",
  "client_secret_expires_at": 0,
  "client_uri": "",
  "created_at": "2024-10-03T18:58:47Z",
  "grant_types": ["authorization_code", "refresh_token"],
  "jwks": {},
  "logo_uri": "",
  "metadata": {},
  "owner": "",
  "policy_uri": "",
  "redirect_uris": ["http://127.0.0.1:5555/callback"],
  "registration_access_token": "ory_at_KpKfbC-uYyom9FFEknRkxqkszxpZB4M9_mKXagP8fBA.-UGtcyTiywnb-Wz-t3L1WIJsP1erOb63y_S1dbcKv1o",
  "registration_client_uri": "http://127.0.0.1:4444/oauth2/register/",
  "request_object_signing_alg": "RS256",
  "response_types": ["code", "id_token"],
  "scope": "openid offline",
  "skip_consent": false,
  "skip_logout_consent": false,
  "subject_type": "public",
  "token_endpoint_auth_method": "client_secret_basic",
  "tos_uri": "",
  "updated_at": "2024-10-03T18:58:46.963209Z",
  "userinfo_signed_response_alg": "none"
}
```

## building

Not x-platform or multi-stage.

You will have to change aardvarkllc to your own account to generate the service image.

```bash
./build.sh
```

## running

### docker compose

Run `compose.sh` to launch the service.
Set the 'host' in launch.json to 127.0.0.1 then launch the debugger using "Remote golang debug in Docker container". Once attached, you can set a breakpoint then instruct the debugger to run the service.

### docker swarm

Run `swarm.sh` to deploy the stack to the swarm.
It may be necessary to open the swarm node's firewall to access port 2345. On Red Hat variants:

```bash
# optionally append '--permanent'
sudo firewall-cmd --add-port=2345/tcp
```

Run `de-swarm.sh` to remove the stack.
