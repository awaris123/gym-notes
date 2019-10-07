from config import auth

class User(object):

    ''' User class to interact with firebase services '''

    # Constuctor only used for account creation
    def __init__(self, email="", password="", uid="", id_token=""):
        self.uid = uid
        self.email = email
        self.password = password
        self.id_token = id_token 
 
    def create(self):
        
        ''' Create a new user with email and password '''

        try:
            n_user = auth.create_user(email=self.email, password=self.password)
            self.uid = n_user.uid
            return {"message" : "Successfully created user: {}".format(self.email)}

        except:
            return {"message" : "Unable to create user"}

    
    def delete(self):

        ''' Delete a user with a verified id_token from client, 
            Ensures that only a user can delete their own account from
            a signed in device '''
        
        try:
            verified_uid = auth.verify_id_token(self.id_token)['uid']
            auth.delete_user(verified_uid)
            return {"message" : "Successfully deleted user: {}".format(self.email)}

        except:
            return {"message" : "Unable to delete user"}



        
