package ProjectCommunicationManagement.ReportPerformance

class UserAvatar {

    String userId
    byte[] avatar
    String avatarType

    static constraints = {
        avatar(nullable:true, maxSize: 16384 /* 16K */)
        avatarType(nullable:true)
    }
}
