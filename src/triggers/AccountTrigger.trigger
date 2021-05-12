trigger AccountTrigger on Account (before update) {
try {
    throw new DMlException();
}
catch (Exception ex) {
    System.debug(ex.getStackTraceString());
}
}