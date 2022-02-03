# How to set up the infrastructure

- [ ] Create new GitHub Organization
- Create Teams
    - [ ] Everyone
        - [ ] Company-A
            - [ ] Team-A1
            - [ ] Team-A2
            - [ ] Team-A3
        - [ ] Company-B
            - [ ] Team-B1
            - [ ] Team-B2
            - [ ] Team-B3
        - [ ] Instructors
- [ ] organization/people/ felhasználó kijelölés / change role -> owner
    - Has full administrative access to the entire organization.
- [ ] Enable auto code review assignment with 2 reviewers for every teams
    - Also enabled for Company-A, Company-B and Instructors, although those should not be necessary
- [ ] Fork handout repo from the previous organization
- [ ] Add labels as repository defaults in organization/settings/repository defaults
    - effort: high
    - effort: low
    - effort: moderate
    - priority: critical
    - priority: high
    - priority: low
    - priority: normal
    - status: completed
    - status: duplicate
    - status: help wanted
    - status: in progress
    - status: invalid
    - status: pending
    - status: review needed
    - status: stalled
    - status: wontfix
    - type: bug
    - type: design
    - type: documentation
    - type: enhancement
    - type: integration
    - ~~type: question~~
        - not required since Discussions GH function is introduced
    - type: user story
- Create new repos for the project
    - [ ] AutomatedCar-A
    - [ ] AutomatedCar-B
- Disable repo Wiki (simply not necessary)
    - [ ] AutomatedCar-A
    - [ ] AutomatedCar-B
- Enable repo Discussions
    - [ ] AutomatedCar-A
    - [ ] AutomatedCar-B
- Add repositories to Teams and set permissions
    - [ ] Match `AutomatedCar-A` to `Company-A` with `write` permissions
    - [ ] Match `AutomatedCar-B` to `Company-B` with `write` permissions
    - [ ] Set admin permissions to team `Instructors`
- Add milestones per sprint
    - [ ] repo A
    - [ ] repo B
- Add projects (kanban boards) from `Automated kanban with reviews` template
    - one project for every teams
    - remove initial notes
    - [ ] repo A
    - [ ] repo B
- Add user stories: the text can be copied from the handout, but the links should be adjusted, as the mdbook uses relative urls
    - [ ] repo A
    - [ ] repo B
- Add link to team forums (discussion boards) and user stories in the project descriptions
  - copy badges to the project description from below
  - [ ] repo A
  - [ ] repo B
- Integrate CI
    - GitHub Actions
    - [ ] repo A
    - [ ] repo B
<!-- - Integrate static code analyzer
    - CodeFactor.io
    - [ ] repo A
    - [ ] repo B -->
- Integrate code coverage tracker
    - CodeCov.io
    - [ ] repo A
    - [ ] repo B
- Enable stale bot to mark issues as staled if there is no activity for a while
    - [ ] repo A
    - [ ] repo B
- Update badges in the README
    - [ ] repo A
    - [ ] repo B
- [ ] Create a tag from the skeleton
    - `git tag -a skeleton -m 'Tag skeleton'`
    -  and push it: `git push origin --tags`
<!-- - Create team branches
    - `git checkout -b TeamA1`
    - `git push origin TeamA1`
    - [ ] repo A
    - [ ] repo B -->
- Protect master/main branches
    - [ ] repo A
    - [ ] repo B


# Project badges

## Company A

[![forum](https://img.shields.io/badge/forum-Team%20A1-65C1A2.svg)](https://github.com/orgs/szfmv2022-Tavasz/teams/team-a1)
[![sprint1](https://img.shields.io/badge/sprint1-Powertrain-BBE9FA.svg)](https://github.com/szfmv2022-Tavasz/AutomatedCar-A/issues/1)
[![sprint2](https://img.shields.io/badge/sprint2-AEB-FFC0CB.svg)](https://github.com/szfmv2022-Tavasz/AutomatedCar-A/issues/4)

[![forum](https://img.shields.io/badge/forum-Team%20A2-F98B60.svg)](https://github.com/orgs/szfmv2022-Tavasz/teams/team-a2)
[![sprint1](https://img.shields.io/badge/sprint1-Sensor-BBE9FA.svg)](https://github.com/szfmv2022-Tavasz/AutomatedCar-A/issues/2)
[![sprint2](https://img.shields.io/badge/sprint2-LKA-FFC0CB.svg)](https://github.com/szfmv2022-Tavasz/AutomatedCar-A/issues/5)

[![forum](https://img.shields.io/badge/forum-Team%20A3-8B9DC9.svg)](https://github.com/orgs/szfmv2022-Tavasz/teams/team-a3)
[![sprint1](https://img.shields.io/badge/sprint1-NPC-BBE9FA.svg)](https://github.com/szfmv2022-Tavasz/AutomatedCar-A/issues/3)
[![sprint2](https://img.shields.io/badge/sprint2-ACC-FFC0CB.svg)](https://github.com/szfmv2022-Tavasz/AutomatedCar-A/issues/6)

## Company B

[![forum](https://img.shields.io/badge/forum-Team%20A1-65C1A2.svg)](https://github.com/orgs/szfmv2022-Tavasz/teams/team-b1)
[![sprint1](https://img.shields.io/badge/sprint1-Powertrain-BBE9FA.svg)](https://github.com/szfmv2022-Tavasz/AutomatedCar-B/issues/1)
[![sprint2](https://img.shields.io/badge/sprint2-AEB-FFC0CB.svg)](https://github.com/szfmv2022-Tavasz/AutomatedCar-B/issues/4)

[![forum](https://img.shields.io/badge/forum-Team%20A2-F98B60.svg)](https://github.com/orgs/szfmv2022-Tavasz/teams/team-b2)
[![sprint1](https://img.shields.io/badge/sprint1-Sensor-BBE9FA.svg)](https://github.com/szfmv2022-Tavasz/AutomatedCar-B/issues/2)
[![sprint2](https://img.shields.io/badge/sprint2-LKA-FFC0CB.svg)](https://github.com/szfmv2022-Tavasz/AutomatedCar-B/issues/5)

[![forum](https://img.shields.io/badge/forum-Team%20A3-8B9DC9.svg)](https://github.com/orgs/szfmv2022-Tavasz/teams/team-b3)
[![sprint1](https://img.shields.io/badge/sprint1-NPC-BBE9FA.svg)](https://github.com/szfmv2022-Tavasz/AutomatedCar-B/issues/3)
[![sprint2](https://img.shields.io/badge/sprint2-ACC-FFC0CB.svg)](https://github.com/szfmv2022-Tavasz/AutomatedCar-B/issues/6)

Powertrain, AEB
Sensor, LKA
NPC, ACC

## Régi felépítés

[![forum](https://img.shields.io/badge/forum-Team%20A1-65C1A2.svg)](https://github.com/orgs/szfmv2021-Tavasz/teams/team-a1)
[![sprint1](https://img.shields.io/badge/sprint1-HMI-BBE9FA.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-A/issues/1)
[![sprint2](https://img.shields.io/badge/sprint2-Ultrasonic-FFC0CB.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-A/issues/5)
[![sprint3](https://img.shields.io/badge/sprint3-Parking%20Pilot-FFC864.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-A/issues/9)

[![forum](https://img.shields.io/badge/forum-Team%20A2-F98B60.svg)](https://github.com/orgs/szfmv2021-Tavasz/teams/team-a2)
[![sprint1](https://img.shields.io/badge/sprint1-Model-BBE9FA.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-A/issues/2)
[![sprint2](https://img.shields.io/badge/sprint2-Camera%20&%20Collosion-FFC0CB.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-A/issues/6)
[![sprint3](https://img.shields.io/badge/sprint3-Lane%20Keeping%20Assistant-FFC864.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-A/issues/10)

[![forum](https://img.shields.io/badge/forum-Team%20A3-8B9DC9.svg)](https://github.com/orgs/szfmv2021-Tavasz/teams/team-a3)
[![sprint1](https://img.shields.io/badge/sprint1-Powertrain-BBE9FA.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-A/issues/3)
[![sprint2](https://img.shields.io/badge/sprint2-NPC-FFC0CB.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-A/issues/7)
[![sprint3](https://img.shields.io/badge/sprint3-Adaptive%20Cruise%20Control-FFC864.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-A/issues/11)

[![forum](https://img.shields.io/badge/forum-Team%20A4-E589C1.svg)](https://github.com/orgs/szfmv2021-Tavasz/teams/team-a4)
[![sprint1](https://img.shields.io/badge/sprint1-Visualization-BBE9FA.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-A/issues/4)
[![sprint2](https://img.shields.io/badge/sprint2-Radar-FFC0CB.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-A/issues/8)
[![sprint3](https://img.shields.io/badge/sprint3-Automatic%20Emergency%20Braking-FFC864.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-A/issues/12)


[![forum](https://img.shields.io/badge/forum-Team%20B1-A6D751.svg)](https://github.com/orgs/szfmv2021-Tavasz/teams/team-b1)
[![sprint1](https://img.shields.io/badge/sprint1-HMI-BBE9FA.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-B/issues/1)
[![sprint2](https://img.shields.io/badge/sprint2-Ultrasonic-FFC0CB.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-B/issues/5)
[![sprint3](https://img.shields.io/badge/sprint3-Parking%20Pilot-FFC864.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-B/issues/9)

[![forum](https://img.shields.io/badge/forum-Team%20B2-FFD92E.svg)](https://github.com/orgs/szfmv2021-Tavasz/teams/team-b2)
[![sprint1](https://img.shields.io/badge/sprint1-Model-BBE9FA.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-B/issues/2)
[![sprint2](https://img.shields.io/badge/sprint2-Camera%20&%20Collosion-FFC0CB.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-B/issues/6)
[![sprint3](https://img.shields.io/badge/sprint3-Lane%20Keeping%20Assistant-FFC864.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-B/issues/10)

[![forum](https://img.shields.io/badge/forum-Team%20B3-E3C294.svg)](https://github.com/orgs/szfmv2021-Tavasz/teams/team-b3)
[![sprint1](https://img.shields.io/badge/sprint1-Powertrain-BBE9FA.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-B/issues/3)
[![sprint2](https://img.shields.io/badge/sprint2-NPC-FFC0CB.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-B/issues/7)
[![sprint3](https://img.shields.io/badge/sprint3-Adaptive%20Cruise%20Control-FFC864.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-B/issues/11)

[![forum](https://img.shields.io/badge/forum-Team%20B4-B3B3B3.svg)](https://github.com/orgs/szfmv2021-Tavasz/teams/team-b4)
[![sprint1](https://img.shields.io/badge/sprint1-Visualization-BBE9FA.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-B/issues/4)
[![sprint2](https://img.shields.io/badge/sprint2-Radar-FFC0CB.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-B/issues/8)
[![sprint3](https://img.shields.io/badge/sprint3-Automatic%20Emergency%20Braking-FFC864.svg)](https://github.com/SzFMV2021-Tavasz/AutomatedCar-B/issues/12)


HMI, Ultrasonic, Parking Pilot

Model, Camera & Collosion, LKA

Powertrain, NPC, ACC

Visualization, Radar, AEB
