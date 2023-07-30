abstract class IUserException{
  final String message;
  final StackTrace? stackTrace;
  
  const IUserException(this.message, [this.stackTrace]);
}

class UserException extends IUserException{
  const UserException(super.message, [super.stackTrace]);
}

class UserDatasourceException extends IUserException{
  const UserDatasourceException(super.message, [super.stackTrace]);
}
