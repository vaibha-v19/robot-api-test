import adal


class AzureADAuthentication:
    def __init__(self, tenant_id, client_id, client_secret):
        self.tenant_id = tenant_id
        self.client_id = client_id
        self.client_secret = client_secret

    def get_access_token(self):
        context = adal.AuthenticationContext(f"https://login.microsoftonline.com/{self.tenant_id}")
        token_response = context.acquire_token_with_client_credentials(
            "https://graph.microsoft.com",
            self.client_id,
            self.client_secret
        )
        return token_response['accessToken']