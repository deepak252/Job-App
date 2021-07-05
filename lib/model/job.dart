class Job{
  final int id;
  final String url;
  final String title;
  final String companyName;
  final String category;
  final List<dynamic> tags;
  final String jobType;
  final String publicationDate;
  final String candidateRequiredLocation;
  final String salary;
  final String description;

  Job({
    required this.id,
    required this.url,
    required this.title,
    required this.companyName,
    required this.category,
    required this.tags,
    required this.jobType,
    required this.publicationDate,
    required this.candidateRequiredLocation,
    required this.salary,
    required this.description,

  });

  static Job fromJson(json) => Job(
    id: json['id'],
    url: json['url'],
    title: json['title'],
    companyName: json['company_name'],
    category: json['category'],
    tags: json['tags'],
    jobType: json['job_type'],
    publicationDate: json['publication_date'],
    candidateRequiredLocation: json['candidate_required_location'],
    salary: json['salary'],
    description: json['description'],
  );
  

  
}


// {
// "id": 749061,
// "url": "https://remotive.io/remote-jobs/all-others/director-of-culinary-749061",
// "title": "Director of Culinary",
// "company_name": "Hungryroot",
// "category": "All others",
// "tags": [],
// "job_type": "full_time",
// "publication_date": "2021-07-05T01:40:47",
// "candidate_required_location": "USA Only",
// "salary": "",
// "description": 