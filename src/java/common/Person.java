package common;

public class Person {

	private String name;   //멤버 변수  접근 지정자는 private로 해야함
	
	
	public Person() {}    // 기본 생성자 있어야 함
	
	public Person(String name, int age) {   // 생성자 추가 (generate constructor)
		super();
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	private int age;
	
	
	

}
