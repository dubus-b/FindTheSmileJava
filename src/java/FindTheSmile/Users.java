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

    private final String firstname;
    private final String lastname;
    private final String birthDate; //DATE
    private final String phoneNumber;
    private final String email;
    private final String password;
    private final Integer lastScore;
    private final Integer bestScore;
    private final Integer id;

    public Users(String argName, String argSurname, String argBirstDate,
            String argPhoneNumber, String argEmail, String argPassword,
            Integer argLastScore, Integer argBestScore, Integer argId) {
        this.firstname = argSurname;
        this.lastname = argName;
        this.birthDate = argBirstDate;
        this.phoneNumber = argPhoneNumber;
        this.email = argEmail;
        this.password = argPassword;
        this.lastScore = argLastScore;
        this.bestScore = argBestScore;
        this.id = argId;
    }

    public String getFirstName() {
        return firstname;
    }

    public String getLastName() {
        return lastname;
    }

    public String getBirthDate() {
        return birthDate;
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
    public Integer getId() {
        return id;
    }
}
