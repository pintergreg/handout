# How to set up the infrastructure

1. Create new GitHub Organization
2. Create Teams
    - Everyone
        - Group A
            - Team A1
            - Team A2
            - Team A3
            - Team A4
        - Group B
            - Team B1
            - Team B2
            - Team B3
            - Team B4
        - Staff
3. Create new repos for the project
    - AutomatedCar-A
    - AutomatedCar-B
    - handout
4. Add repositories to Teams and set permissions
    - Match `AutomatedCar-A` to `Group A` with `write` permissions
    - Match `AutomatedCar-B` to `Group B` with `write` permissions
    - Set admin persmissions to team `Staff`
5. Add labels
    - user story
    - stale
    - 1 to 5 stars for difficulty
        - as GitHub does not hav a difficulty property for issues
    - design
6. Add milestones
    - Planning, Release Candidate and Final for every sprints
7. Add projects (kanban boards) from `Automated kanban with review` template
    - one project for every teams for both repositories
9. Add first user stories
10. Add link to team forums (discussion boards) and user stories in the project descriptions
11. Integrate CI
    - GitHub Actions
12. Integrate static code analyzer
    - CodeFactor.io
13. Integrate code coverage tracker
    - CodeCov.io
14. Enable stale bot to mark issues as staled if there is no activity for a while
15. Update badges in the README
16. Create a tag from the skeleton
    - `git tag -a skeleton -m 'Tag skeleton'`
    -  and push it: `git push origin --tags`
17. Create team branches
    - `git checkout -b TeamA1`
    - `git push origin TeamA1`
18. Protect branches
