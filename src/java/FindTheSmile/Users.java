/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FindTheSmile;

/**
 *
 * @author bdubus
 */
public class Users {

    private final String name;
    private final String surname;
    private final String birstDate; //DATE
    private final String phoneNumber;
    private final String email;
    private final String password;
    private final Integer lastScore;
    private final Integer bestScore;

    public Users(String argName, String argSurname, String argBirstDate,
            String argPhoneNumber, String argEmail, String argPassword,
            Integer argLastScore, Integer argBestScore) {
        this.name = argName;
        this.surname = argSurname;
        this.birstDate = argBirstDate;
        this.phoneNumber = argPhoneNumber;
        this.email = argEmail;
        this.password = argPassword;
        this.lastScore = argLastScore;
        this.bestScore = argBestScore;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getBirstDate() {
        return birstDate;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public Integer getLastScore() {
        return lastScore;
    }

    public Integer getBestScore() {
        return bestScore;
    }
}
