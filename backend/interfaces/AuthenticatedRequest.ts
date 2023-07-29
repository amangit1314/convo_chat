export default interface AuthenticatedRequest extends Request {
    token?: any;
}